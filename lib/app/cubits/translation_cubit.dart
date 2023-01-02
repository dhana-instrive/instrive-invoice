
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/resources/language_manager.dart';
import '../app_prefs.dart';

class TranslationCubit extends Cubit<Locale>{

  TranslationCubit():super(ENGLISH_LOCALE);

  Future<void> getLocale()async{

    var sharedPrefs = await SharedPreferences.getInstance();
    var language = await AppPreferences(sharedPreferences: sharedPrefs).getAppLanguage();
    emit(language.getLocale());

  }

  Future<void> changeLocale(String type)async{

    var sharedPrefs = await SharedPreferences.getInstance();
    await AppPreferences(sharedPreferences: sharedPrefs).saveLanguage(type);
    getLocale();
  }


}