import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_apps/features/bloc/bloc.dart';
import 'package:marketing_apps/features/bloc/delegate_bloc.dart';
import 'package:marketing_apps/features/login/login_screen.dart';
import 'package:marketing_apps/features/main/main_screen.dart';
import 'package:marketing_apps/features/splash/splach_screen.dart';
import 'package:marketing_apps/service/sign_in.dart';

main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository _userRepository = UserRepository();
  MainAppBloc _mainAppBloc;

  @override
  void initState() {
    super.initState();
    _mainAppBloc = MainAppBloc(userRepository: _userRepository);
    _mainAppBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (context) => _mainAppBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.red,
            backgroundColor: Colors.red
          ),
      home: BlocBuilder(
        bloc: _mainAppBloc,
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return MainScreen();
          }
          if (state is Unauthenticated) {
            return LoginPage();
          } 
          return SplashScreen();
        },
      ),
      
    ));
  }

  @override
  void dispose() {
    _mainAppBloc.dispose();
    super.dispose();
  }
}
