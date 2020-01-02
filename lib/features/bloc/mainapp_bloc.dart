import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:marketing_apps/service/sign_in.dart';
import './bloc.dart';

class MainAppBloc
    extends Bloc<MainAppEvent, MainAppState> {
  final UserRepository _userRepository;

  MainAppBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  MainAppState get initialState => Uninitialized();

  @override
  Stream<MainAppState> mapEventToState(
    MainAppEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<MainAppState> _mapAppStartedToState() async* {
    try {
      //  FirebaseAuth auth = await FirebaseAuth.instance;
      //  auth.signOut();
      //  _userRepository.signOutGoogle();
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final name = await _userRepository.getUser();
        yield Authenticated(name);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<MainAppState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<MainAppState> _mapLoggedOutToState() async* {
    _userRepository.signOutGoogle();
    yield Unauthenticated();
  }
}