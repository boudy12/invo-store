

import 'package:invostore1/models/product_model.dart';
import 'package:invostore1/models/user_model.dart';
import 'package:invostore1/modules/login/login_screen.dart';
import 'package:invostore1/shared/components/components.dart';
import 'package:invostore1/shared/network/local/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndFinishSS(context, ECommerceAppLoginScreen());
    }
  });

}
void signOutECommerce(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndFinishSS(context, ECommerceAppLoginScreen());
    }
  });

}

String? token = CacheHelper.getData(key: 'token') ??'';
bool isArabic1 = false ;
bool isDark1 = CacheHelper.getData(key: 'isDark') ?? false;
 int? userId  ;

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');  // 800 is size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
