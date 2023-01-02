import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/resources/theme_manager.dart';
import '../app_prefs.dart';

class ThemesCubit extends Cubit<String>{

  ThemesCubit():super(THEME_LIGHT);

  Future<void> getTheme()async{

    var sharedPrefs = await SharedPreferences.getInstance();
    var theme = await AppPreferences(sharedPreferences: sharedPrefs).getAppTheme();
    emit(theme);
  }

  Future<void> changeTheme(String theme)async{

    var sharedPrefs = await SharedPreferences.getInstance();
    await AppPreferences(sharedPreferences: sharedPrefs).saveTheme(theme);
    getTheme();
  }

}