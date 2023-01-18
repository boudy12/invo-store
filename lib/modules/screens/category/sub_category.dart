import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/modules/screens/search/search_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class SubCategoriesScreen extends StatelessWidget {

  bool? isAdmin = false;
   ECommerceProductModel? model ;

  String? title = '';

  SubCategoriesScreen({Key? key, this.isAdmin,this.title,this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model = ECommerceAppCubit.get(context).eCommerceSubCategoryModel;
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
                'category'.tr
            ),
          ): defaultAppBar(context: context, title:title ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      navigateTo(context,ECommerceAppSearchScreen(isAdmin: isAdmin,));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: isDark1 ? defaultColor2 : Colors.grey[300] ,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:   [
                            const Icon(
                              IconBroken.Search,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                'search'.tr
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! ECommerceAppGetSubCategoriesLoadingState,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1/1.58,
                        children: List.generate(ECommerceAppCubit.get(context).eCommerceSubCategoryModel!.products!.length,
                              (index) => buildGridProduct(ECommerceAppCubit.get(context).eCommerceSubCategoryModel!.products![index],context,isAdmin: isAdmin),
                        ),
                      ),
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),

                  ),


                ],
              ),
            ),
          ),

        );
      },

    );
  }
}
