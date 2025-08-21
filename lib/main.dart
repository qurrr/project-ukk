// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:kantin/tambah user.dart';
// import './Login1.dart';
// import './Menu1.dart';
// import './Keranjang1.dart';
// import './Kasir.dart';
// import './Detailpesanan.dart';
// import './Manager.dart';
// import './Pendapatanharian.dart';
// import './Catatantransaksi.dart';
// import './EditMenu.dart';
// import './Admin.dart';
// import './tambah user.dart';
// import './Edit user.dart';
// import './log aktivitas.dart';
// import 'regist/Register1.dart';

// void main() async {
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MyCanteen',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Menu1Page(),
// routes: {
//   '/kadmin': (context) => AdminPage(),
//   // '/kemenu': (context) => MenuPage(),
//   // '/kelogin': (context) => LoginnPage(),
//   // '/keregist': (context) => Registpage(),
//   // '/Makanan': (context) => MakananPage(),
//   // '/Profil': (context) => EditProfilePage(),
// },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'Routing/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.MENU,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'inter',
      ),
    );
  }
}
