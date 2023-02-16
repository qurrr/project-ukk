import 'package:flutter/material.dart';
import 'package:kantin/admin/tambah%20user.dart';
import '../Homemenu/cart/binding.dart';
import '../kasir/binding/binding.dart';
import '../login/Login1.dart';
import '../Homemenu/Menu.dart';
import '../Homemenu/cart/Keranjang1.dart';
import '../kasir/Kasir.dart';
import '../kasir/Detailpesanan.dart';
import '../Manager/Manager.dart';
import '../Pendapatanharian.dart';
import '../Catatantransaksi.dart';
import '../Manager/Editmenu/HomeMenu.dart';
import '../admin/Admin.dart';
import '../admin/tambah user.dart';
import '../Edit user.dart';
import '../admin/log aktivitas.dart';
import '../regist/Register1.dart';
import '../regist/controller/authregist.dart';
import '../regist/models/player.dart';
import 'package:get/get.dart';
import '../regist/binding/Binding.dart';
import 'package:kantin/login/binding/Binding.dart';
import 'package:kantin/Manager/Editmenu/Tambahmenu/Tambahmenu.dart';
import 'package:kantin/Manager/Editmenu/binding.dart';
import 'package:kantin/Manager/Editmenu/EditMenu.dart';
import 'package:kantin/Manager/Editmenu/Minuman/EditMenumin.dart';
import 'package:kantin/Manager/Editmenu/Makanan/Editmenumak.dart';
import 'package:kantin/Manager/Editmenu/Coffe/Editmenucof.dart';
import 'package:kantin/admin/controller/binding.dart';
import 'package:kantin/Homemenu/bindinghomemenu.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MENU;

  static final routes = [
    GetPage(
      name: _Paths.DETAILPESANAN,
      page: () => DetailPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => KeranjangPage(),
      transition: Transition.fadeIn,
      binding: BindingCart(),
    ),
    GetPage(
      name: _Paths.LOGAKTIV,
      page: () => LogaktifitasPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TAMBAHUSER,
      page: () => TambahuserPage(),
      transition: Transition.fadeIn,
      binding: Tambahuserbinding(),
    ),
    GetPage(
      name: _Paths.EDITMENUCOF,
      page: () => Editmenucof(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.EDITMENUMAK,
      page: () => Editmenumak(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.EDITMENUMIN,
      page: () => Editmenumin(),
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
      binding: Bindinghomenu(),
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
      binding: Tambahuserbinding(),
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
        binding: BindingKasir()),
  ];
}

abstract class Routes {
  Routes._();
  static const DETAILPESANAN = _Paths.DETAILPESANAN;
  static const KERANJANG = _Paths.KERANJANG;
  static const LOGAKTIV = _Paths.LOGAKTIV;
  static const TAMBAHUSER = _Paths.TAMBAHUSER;
  static const EDITMENUCOF = _Paths.EDITMENUCOF;
  static const EDITMENUMAK = _Paths.EDITMENUMAK;
  static const EDITMENUMIN = _Paths.EDITMENUMIN;
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
  static const DETAILPESANAN = '/detailpesanan';
  static const KERANJANG = '/keranjang';
  static const LOGAKTIV = '/logaktiv';
  static const TAMBAHUSER = '/tambahuser';
  static const EDITMENUCOF = '/editmenucof';
  static const EDITMENUMAK = '/editmenumak';
  static const EDITMENUMIN = '/editmenumin';
  static const TAMBAHMENU = '/tambahmenu';
  static const HOMEMENUMANAGER = '/homemenumanager';
  static const MENU = '/menu';
  static const ADMIN = '/admin';
  static const KASIR = '/kasir';
  static const MANAGER = '/manager';

  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
}
