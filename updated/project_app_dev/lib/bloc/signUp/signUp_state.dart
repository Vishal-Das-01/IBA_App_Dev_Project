// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signUp_cubit.dart';

enum SignUpStatus {
  initial,
  submitting,
  success,
  error,
}

class SignUpState extends Equatable {
  final SignUpStatus signUpStatus;

  const SignUpState(
      {required this.signUpStatus,
      r});

  @override
  List<Object> get props => [signUpStatus];

  factory SignUpState.initial() {
    return const SignUpState(
      signUpStatus: SignUpStatus.initial,
     
    );
  }

  @override
  bool get stringify => true;

  SignUpState copyWith({
    SignUpStatus? signUpStatus,
   
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      
    );
  }
}