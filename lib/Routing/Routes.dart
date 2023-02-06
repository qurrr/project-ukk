import 'package:flutter/material.dart';
import 'package:kantin/tambah user.dart';
import '../login/Login1.dart';
import '../Menu1.dart';
import '../Keranjang1.dart';
import '../Kasir.dart';
import '../Detailpesanan.dart';
import '../Manager/Manager.dart';
import '../Pendapatanharian.dart';
import '../Catatantransaksi.dart';
import '../Manager/Editmenu/HomeMenu.dart';
import '../Admin.dart';
import '../tambah user.dart';
import '../Edit user.dart';
import '../log aktivitas.dart';
import '../regist/Register1.dart';
import '../regist/controller/authregist.dart';
import '../regist/models/player.dart';
import 'package:get/get.dart';
import '../regist/binding/Binding.dart';
import 'package:kantin/login/binding/Binding.dart';
import 'package:kantin/Manager/Editmenu/Tambahmenu/Tambahmenu.dart';
import 'package:kantin/Manager/Editmenu/binding.dart';
import 'package:kantin/Manager/Editmenu/EditMenu.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MENU;

  static final routes = [
    GetPage(
      name: _Paths.EDITMENU,
      page: () => EditMenu(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.HOMEMENUMANAGER,
      page: () => Homemenu(),
      transition: Transition.fadeIn,
      binding: Tambahmenbind(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => Menu1Page(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => Login1Page(),
      transition: Transition.fadeIn,
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => Register1Page(),
      transition: Transition.fadeIn,
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MANAGER,
      page: () => ManagerPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.KASIR,
      page: () => KasirPage(),
      transition: Transition.fadeIn,
    ),
  ];
}

abstract class Routes {
  Routes._();
  static const EDITMENU = _Paths.EDITMENU;
  static const TAMBAHMENU = _Paths.TAMBAHMENU;
  static const HOMEMENUMANAGER = _Paths.HOMEMENUMANAGER;
  static const MENU = _Paths.MENU;
  static const ADMIN = _Paths.ADMIN;
  static const KASIR = _Paths.KASIR;
  static const MANAGER = _Paths.MANAGER;

  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
}

abstract class _Paths {
  static const EDITMENU = '/editmenu';
  static const TAMBAHMENU = '/tambahmenu';
  static const HOMEMENUMANAGER = '/homemenumanager';
  static const MENU = '/menu';
  static const ADMIN = '/admin';
  static const KASIR = '/kasir';
  static const MANAGER = '/manager';

  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
}
