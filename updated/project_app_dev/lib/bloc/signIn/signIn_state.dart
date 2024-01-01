// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signIn_cubit.dart';

enum SignInStatus {
  initial,
  submitting,
  success,
  error,
}

class SignInState extends Equatable {
  final SignInStatus signInStatus;

  const SignInState({
    required this.signInStatus,
  });

  factory SignInState.initial() {
    return const SignInState(
      signInStatus: SignInStatus.initial,
    );
  }

  @override
  String toString() =>
      'SignInState(signInStatus: $signInStatus,)';

  @override
  List<Object?> get props => [signInStatus];

  SignInState copyWith({
    SignInStatus? signInStatus,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
    );
  }
}
