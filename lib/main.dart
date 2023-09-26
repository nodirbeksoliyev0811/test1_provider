import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test1_provider/provider/user_provider.dart';

import 'data/network/api_provider.dart';
import 'data/network/user_repository.dart';
import 'home/data_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(
            userRepository: UserRepository(
              apiProvider: ApiProvider(),
            ),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DataScreen(),
        );
      },
    );
  }
}
