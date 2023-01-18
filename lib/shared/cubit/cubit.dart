import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/shared/components/constants.dart';
import 'package:invostore1/shared/cubit/states.dart';
import 'package:invostore1/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  late Database database;





  List<Map> favorites = [];

  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase()
  {
    openDatabase(
      'favorites.db',
      version: 1,
      onCreate: (database, version) {
        print('database Created');
        database.execute(
            'CREATE TABLE favorites (id INTEGER PRIMARY KEY, userId INTEGER, productId INTEGER, status TEXT)'
        ).then((value) {
          print('table created');
        }).catchError((error){
          print('error when created table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database,userId!);
        print('database Opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required int userId,
    required int productId,
  })async
  {
    await database.transaction((txn) {

      txn.rawInsert(
          'INSERT INTO favorites (userId, productId, status) VALUES("$userId","$productId","new")'
      ).then((value){
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database,userId);

      }).catchError((error){
        print(error.toString());
      });
      return null!;
    });
  }

  void getDataFromDatabase(database,int userId)
  {
    favorites = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM favorites').then((value) {
      value.forEach((element) {
        if(element['userId'] == '$userId' && element['status'] == 'new')
          {
            favorites.add(element);
          }
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateData({
  required String status,
  required int userId,
  required int productId,
})
  {
    database.rawUpdate(
        'UPDATE favorites SET status = ? WHERE userId = ? AND productId = ? ',
      [status,userId,productId],
    ).then((value)
    {
      getDataFromDatabase(database,userId);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required int userId,
    required int productId,

  })
  {
    database.rawUpdate(
      'DELETE FROM tasks WHERE userId = ? AND productId = ?',
      [userId,productId],
    ).then((value)
    {
      getDataFromDatabase(database,userId);
      emit(AppDeleteDatabaseState());
    });
  }


  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,

}){
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;
  IconData lightIcon = Icons.brightness_3_outlined;

  bool isArabic = false;

  void changeMode({ bool? fromShared })
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {

        emit(AppChangeModeState());

      });
      isDark1 = CacheHelper.getData(key: 'isDark');

    }

    else{

      CacheHelper.removeData(key: 'isDark');
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {

        emit(AppChangeModeState());

      });
      isDark1 = CacheHelper.getData(key: 'isDark');

    }
  }
  void changeLanguage({ bool? fromShared })
  {
    if(fromShared != null)
    {
      isArabic = fromShared;
      CacheHelper.putData(key: 'isArabic', value: isArabic).then((value) {

        emit(AppChangeLanguageState());

      });
      isArabic1 = CacheHelper.getData(key: 'isArabic');

    }

    else{
      isArabic = !isArabic;
      CacheHelper.putData(key: 'isArabic', value: isArabic).then((value) {

        emit(AppChangeLanguageState());

      });
      isArabic1 = CacheHelper.getData(key: 'isArabic');

    }
  }

  void changeIcon(){
    lightIcon = isDark?Icons.brightness_4_outlined : Icons.brightness_3_outlined;
    emit(AppChangeIconState());
  }







}