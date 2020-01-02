import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainAppEvent extends Equatable {
  MainAppEvent([List props = const []]) : super();
}

class AppStarted extends MainAppEvent {
  // @override
  // String toString() => 'AppStarted';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoggedIn extends MainAppEvent {
  // @override
  // String toString() => 'LoggedIn';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoggedOut extends MainAppEvent {
  // @override
  // String toString() => 'LoggedOut';

  @override
  // TODO: implement props
  List<Object> get props => null;
}
