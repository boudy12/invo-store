import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/modules/screens/cart/counter.dart';
import 'package:invostore1/modules/screens/search/cubit/cubit.dart';
import 'package:invostore1/modules/screens/search/cubit/states.dart';
import 'package:invostore1/modules/screens/show_product.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

// ignore: must_be_immutable
class ECommerceAppSearchScreen extends StatelessWidget {

  bool? isAdmin = false;
  ECommerceAppSearchScreen({Key? key,this.isAdmin}) : super(key: key);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ECommerceAppSearchCubit(),
      child: BlocConsumer<ECommerceAppSearchCubit,ECommerceAppSearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ECommerceAppSearchCubit.get(context);
          return Scaffold(
            appBar: isAdmin == true? AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                ),
              ),
              title: Text(
                  'search'.tr
              ),
            ) :  defaultAppBar(
                context: context,
                title: 'Search'
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    defaultFormFieldWithStyle(
                      context: context,
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (value){
                        if(value!.isEmpty)
                        {
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                      text: 'Search',
                      prefixIcon: Icons.search_outlined,
                      onChanged: (value){
                       // cubit.search(text: value);
                      },
                      onSubmit: (text){
                        if(formKey.currentState!.validate())
                        {
                          cubit.search(text: text);

                        }
                      },
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if(state is ECommerceAppSearchLoadingStates)
                      const LinearProgressIndicator(),

                    if(state is ECommerceAppSearchSuccessStates)
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: state is! ECommerceAppSearchLoadingStates,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildListItem(cubit.searchModel.products![index],context,isFav: true,isAdmin: isAdmin), //cubit.searchModel.data!.data![index],
                            separatorBuilder: (context, index) => buildSpacerLine(),
                            itemCount: cubit.searchModel.products!.length
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget buildListItem(ProductModel favModel,context ,{bool? isFav = false,bool? isAdmin = false, int? value =1,int? index = 1 }) => InkWell(
    onTap: () {
      navigateTo(
          context,
          ShowProductScreen(
            model: favModel,
          )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130,
              clipBehavior: Clip.antiAlias,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child:  Image(
                image: NetworkImage(
                  favModel.img!,
                ),
                height: 200,

              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Text(
                          '${favModel.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),

                      ],
                    ),
                  ),
                  Text(
                    '${favModel.description}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          '${favModel.price}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: defaultColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Spacer(),
                        isFav != true? CounterScreen(index: index,): Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

}
