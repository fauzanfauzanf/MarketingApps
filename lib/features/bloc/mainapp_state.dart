import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainAppState extends Equatable {
  const MainAppState();
}

class Uninitialized extends MainAppState {
  @override
  String toString() => 'Uninitialized';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class Authenticated extends MainAppState {
  final String displayName;

  Authenticated(this.displayName) : super();

  @override
  String toString() => 'Authenticated { displayName: $displayName }';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class Unauthenticated extends MainAppState {
  @override
  String toString() => 'Unauthenticated';

  @override
  // TODO: implement props
  List<Object> get props => null;
}