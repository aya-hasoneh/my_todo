// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/task.dart';
import '/utils/colors.dart';
import '/routes/routes.dart';
import 'database/hive_data_store.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  var box = await Hive.openBox<Task>('tasks');

  // box.values.forEach((task) {
  //   if (task.createdAt.day != DateTime.now().day) {
  //     box.delete(task.id);
  //   }
  // });

  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThingsTODO',
      theme: ThemeData(
        primaryColor: ThemeColors.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColors.primaryColor,
          elevation: 0,
          centerTitle: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ThemeColors.primaryColor,
            onPrimary: ThemeColors.whiteColor,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
      ),
      initialRoute: '/',
      routes: routes,
      builder: EasyLoading.init(),
    );
  }
}
