import 'package:contact/core/di/get_injectable.dart';
import 'package:contact/features/user_profile/cubit/userprofile_cubit.dart';
import 'package:contact/features/user_profile/presentation/profile_Page.dart';
import 'package:contact/features/user_profile/repo/get_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => UserprofileCubit(
              userProfileModelRepository:
                  locator<UserProfileModelRepository>()),
          child: const ProfilePage(),
        ));
  }
}
