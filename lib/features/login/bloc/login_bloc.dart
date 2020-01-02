import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:marketing_apps/features/login/bloc/bloc.dart';
import 'package:marketing_apps/service/sign_in.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    }
  }


Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
  try {
    yield LoginState.loading();
    await _userRepository.signInWithGoogle();
    yield LoginState.success();
  } catch (_) {
    yield LoginState.failure();
  }
}
}