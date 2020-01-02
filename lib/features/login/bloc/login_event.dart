import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}


class LoginWithGooglePressed extends LoginEvent {
  // @override
  // String toString() => 'LoginWithGooglePressed';

  @override
  // TODO: implement props
  List<Object> get props => null;
}


