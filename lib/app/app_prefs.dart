
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';
import '../presentation/resources/theme_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_THEME = "PREFS_KEY_THEME";
const String PREFS_ACCESS_TOKEN = "PREFS_ACCESS_TOKEN";
const String PREFS_REFRESH_TOKEN = "PREFS_REFRESH_TOKEN";

class AppPreferences{

  SharedPreferences sharedPreferences;
  AppPreferences({required this.sharedPreferences});

  Future<void> saveLanguage(String lang) async => await sharedPreferences.setString(PREFS_KEY_LANG, lang);

  Future<String> getAppLanguage() async{
    String? language = sharedPreferences.getString(PREFS_KEY_LANG);
    if(language !=null && language.isNotEmpty){
      return language;
    }else{
      return ENGLISH;
    }
  }

  Future<void> saveTheme(String theme) async => await sharedPreferences.setString(PREFS_KEY_THEME, theme);

  Future<String> getAppTheme() async{
    String? theme = sharedPreferences.getString(PREFS_KEY_THEME);
    if(theme !=null && theme.isNotEmpty){
      return theme;
    }else{
      return THEME_LIGHT;
    }
  }

  Future<Locale> getCurrentLocale() async{
    String currentLanguage = await getAppLanguage();
    return currentLanguage.getLocale();
  }

}