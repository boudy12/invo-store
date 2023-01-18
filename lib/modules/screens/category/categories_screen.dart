import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/brands.dart';
import 'package:invostore1/models/categories_model.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/modules/screens/category/sub_category.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/icon_broken.dart';

class CategoriesScreen extends StatelessWidget {

  bool? isAdmin = false;

  CategoriesScreen({Key? key, this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ECommerceAppCubit.get(context);
        return  ListView.separated(
            itemBuilder: (context, index) => buildCategoriesItem(cubit.eCommerceCategoriesModel!.products![index],index+1,context,isAdmin: isAdmin),
            separatorBuilder:  (context, index) => const SizedBox(width: 10,),
            itemCount: cubit.eCommerceCategoriesModel!.products!.length
        );
      },
    );
  }

  Widget buildCategoriesItem(CategoriesModel model,int index,context,{bool? isAdmin = false})=> InkWell(
  onTap: () {
    navigateTo(context, SubCategoriesScreen(
      isAdmin: isAdmin,
      title: model.name!,

    ));
    ECommerceAppCubit.get(context).getSubCategory(id: model.id!);
  },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    model.img!
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          const SizedBox(
            width: 20,
          ),
           Text(
             model.name!,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),

          ),
          const Spacer(),
          IconButton(
            onPressed: (){
              navigateTo(context, SubCategoriesScreen(
                isAdmin: isAdmin,
                title: model.name!,
              ));
            },
            icon: Icon(
              isArabic1 ? IconBroken.Arrow___Left_2  :IconBroken.Arrow___Right_2   ,
            ),
          ),
        ],
      ),
    ),
  );
}
