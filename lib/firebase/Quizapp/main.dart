import 'package:fairbaseeg/firebase/LOGIN/regcurd.dart';
import 'package:fairbaseeg/firebase/Quizapp/quizLoginpage.dart';
import 'package:fairbaseeg/firebase/Quizapp/quizregistration.dart';
import 'package:fairbaseeg/firebase/Quizapp/quizsplashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'aaaaa.dart';


Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

      options: const FirebaseOptions(
          apiKey: "AIzaSyA9Xuyh6nr8AYvouopxBISaGvu9wcr7Bmg",
          appId: '1:722663453592:android:77aaecab90aa72ce93f1ed',
          storageBucket: 'shasliyafirebase.firebasestorage.app',
          messagingSenderId: "",
          projectId: 'shasliyafirebase')

  );
  runApp(GetMaterialApp(home:SplashScreen (),));
}