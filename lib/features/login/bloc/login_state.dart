import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool isLoading;



  LoginState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isLoading,
  });

  factory LoginState.empty() {
    return LoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isLoading: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isLoading: true,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isLoading: false,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isLoading: false,
    );
  }

  

  // LoginState copyWith({
  //   bool isEmailValid,
  //   bool isPasswordValid,
  //   bool isSubmitEnabled,
  //   bool isSubmitting,
  //   bool isSuccess,
  //   bool isFailure,
  // }) {
  //   return LoginState(
  //     isSubmitting: isSubmitting ?? this.isSubmitting,
  //     isSuccess: isSuccess ?? this.isSuccess,
  //     isFailure: isFailure ?? this.isFailure,
  //   );
  // }

  @override
  String toString() {
    return '''LoginState {
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }

  
}