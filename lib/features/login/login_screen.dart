import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_apps/features/bloc/bloc.dart';
import 'package:marketing_apps/features/bloc/mainapp_bloc.dart';
import 'package:marketing_apps/features/login/bloc/bloc.dart';
import 'package:marketing_apps/service/sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  bool isLoading = false;
  @override
  void initState() {
    _loginBloc = LoginBloc(userRepository: UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) => _loginBloc,
        child: BlocListener(
          bloc: _loginBloc,
          listener: (context, state) {
            if (state is LoginState) {
              if (state.isSuccess) {
                BlocProvider.of<MainAppBloc>(context).dispatch(LoggedIn());
              }
              if (state.isLoading) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state.isFailure) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
          child: BlocBuilder(
            bloc: _loginBloc,
            builder: (context, state) {
              return isLoading
                  ? Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),))
                  : Container(
                      color: Colors.red,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("M",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 65,
                                    fontFamily: 'Gruppo')),
                            Text("MarketingApps",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Muli')),
                            SizedBox(height: 50),
                            _signInButtonGoogle(),
                            Padding(
                              padding: EdgeInsets.only(bottom: 30),
                            ),
                            _signInButtonPhone()
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _signInButtonGoogle() {
    return OutlineButton(
      splashColor: Colors.lightBlue,
      onPressed: () {
        // BlocProvider.of<LoginBloc>(context).dispatch(LoginWithGooglePressed());
        _loginBloc.dispatch(LoginWithGooglePressed());
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Muli'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButtonPhone() {
    return OutlineButton(
      splashColor: Colors.green,
      onPressed: () {
        // AuthScreen();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Phone  ',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Muli'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
