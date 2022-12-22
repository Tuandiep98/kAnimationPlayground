import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kanimation_playground/utils/string_extension.dart';

import '../../../global/global_data.dart';
import '../../../global/locator.dart';
import '../../../utils/storage_manager.dart';
import '../../firebase/services/ifirebase_service.dart';
import '../models/account/account_model.dart';

part 'setting_event.dart';
part 'setting_state.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  dialogBackgroundColor: Colors.black54,
  fontFamily: 'SF Pro',
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xffF2F5F7),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  dialogBackgroundColor: Colors.grey[200],
  fontFamily: 'SF Pro',
);

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  var _firebaseService = locator<IFirebaseService>();
  var _globalData = locator<GlobalData>();

  late ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  bool _isDarkMode = false;
  bool isDarkMode() => _isDarkMode;
  SettingBloc() : super(ThemeLoaded(themeData: lightTheme)) {
    on<ThemeStarted>((event, emit) async {
      // theme check
      var theme = await StorageManager.readData('themeMode');
      print('value read from storage: ' + theme.toString());
      var themeMode = theme ?? 'light';
      if (themeMode == 'light') {
        print('setting light theme');
        await setLightMode();
      } else {
        print('setting dark theme');
        await setDarkMode();
      }

      // session check

      var accountAlreadyLogged = await _firebaseService.getCurrentUser();
      if (accountAlreadyLogged != null) {
        var accountModel = await storeAccountToStorage(accountAlreadyLogged);
        emit(ThemeLoadedWithAccount(accountModel, themeData: _themeData));
        return;
      }

      var accountModelJson = await StorageManager.readJsonData('auth');
      if (accountModelJson != null) {
        var accountModel = AccountModel.fromJson(accountModelJson);
        if (!accountModel.id.isNullOrEmpty()) {
          emit(ThemeLoadedWithAccount(accountModel, themeData: _themeData));
          return;
        }
      }

      emit(ThemeLoaded(themeData: _themeData));
    });

    on<ThemeChanged>((event, emit) async {
      if (!isDarkMode()) {
        await setDarkMode();
      } else {
        await setLightMode();
      }
      // session check
      var accountModelJson = await StorageManager.readJsonData('auth');
      if (accountModelJson != null) {
        AccountModel accountModel = AccountModel.fromJson(accountModelJson);
        if (!accountModel.id.isNullOrEmpty()) {
          emit(ThemeLoadedWithAccount(accountModel, themeData: _themeData));
          return;
        }
      }

      emit(ThemeLoaded(themeData: _themeData));
    });

    on<GoogleSigninClicked>((event, emit) async {
      AccountModel account;
      account = await signInWithGoogle();
      emit(ThemeLoadedWithAccount(account, themeData: _themeData));
    });

    on<SignoutClicked>((event, emit) async {
      AccountModel account =
          AccountModel.fromJson(await StorageManager.readJsonData('auth'));
      if (!account.id.isNullOrEmpty()) {
        await signOut();
      }
      emit(ThemeLoaded(themeData: _themeData));
    });
  }

  Future<void> setDarkMode() async {
    _themeData = darkTheme;
    _isDarkMode = true;
    await StorageManager.saveData('themeMode', 'dark');
  }

  Future<void> setLightMode() async {
    _isDarkMode = false;
    _themeData = lightTheme;
    await StorageManager.saveData('themeMode', 'light');
  }

  Future<AccountModel> signInWithGoogle() async {
    var currentUser = await _firebaseService.signInWithGoogle();
    return await storeAccountToStorage(currentUser);
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
    await StorageManager.deleteData('auth');
    _globalData.currentUser = null;
  }

  Future<AccountModel> storeAccountToStorage(
      GoogleSignInAccount? account) async {
    var accountModel = AccountModel(
      email: account!.email,
      id: account.id,
      displayName: account.displayName,
      photoUrl: account.photoUrl,
      serverAuthCode: account.serverAuthCode,
    );

    await StorageManager.saveJsonData('auth', accountModel);
    _globalData.currentUser = accountModel;
    return accountModel;
  }
}
