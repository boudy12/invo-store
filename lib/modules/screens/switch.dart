import 'package:flutter/material.dart';
import 'package:invostore1/admin/layout/e-commerce_admin_layout.dart';
import 'package:invostore1/layout/e-commerce_layout.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/icon_broken.dart';

class SwitchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){
                      navigateTo(context, ECommerceLayoutScreen());
                    },
                    child: Row(
                      children: [
                        Text(
                            'User',
                          style: TextStyle(
                            fontSize: 26
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: (){
                            navigateTo(context, ECommerceLayoutScreen());
                          },
                          icon: Icon(
                            isArabic1 ? IconBroken.Arrow___Left_2  :IconBroken.Arrow___Right_2   ,
                          ),
                        ),
                      ],
                    )
                ),

                buildSpacerLine2(),
                TextButton(
                    onPressed: (){
                      navigateTo(context, ECommerceLayoutAdminScreen());
                    },
                    child: Row(
                      children: [
                        Text(
                            'Admin',
                          style: TextStyle(
                              fontSize: 26
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: (){
                            navigateTo(context, ECommerceLayoutAdminScreen());
                          },
                          icon: Icon(
                            isArabic1 ? IconBroken.Arrow___Left_2  :IconBroken.Arrow___Right_2   ,
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
