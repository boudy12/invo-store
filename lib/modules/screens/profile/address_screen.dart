import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invostore1/modules/screens/profile/new_address.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/styles/colors.dart';
import 'package:invostore1/styles/icon_broken.dart';

class AddressScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            isArabic1 ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
          ),
        ),
        title: Text(
          'address'.tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildAddressItems(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: 3
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, AddNewAddress());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'addAddress'.tr
                    ),
                    SizedBox(width: 5,),
                    Icon(
                      Icons.add_circle_outline_rounded,
                      size: 36,
                    ),


                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  Widget buildAddressItems()=>Container(
    decoration: BoxDecoration(
      color: isDark1? Colors.black12 :Colors.grey[100],
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Boudy',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Spacer(),
              InkWell(
                  onTap:  (){

                  },
                  child: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.grey,
                  )
              ),
            ],
          ),
          Text(
            '25 تعاونيات القاهرة',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
          Text(
            '264123',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
          Text(
            'Suez',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
          Row(
            children: [
              Text(
                'جمهورية مصر العربية',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Spacer(),
              InkWell(
                  onTap:  (){},
                  child: Icon(
                    Icons.edit,
                    color: defaultColor,
                  )
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
