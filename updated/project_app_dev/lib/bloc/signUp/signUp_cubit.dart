import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:project_app_dev/auth/firebase_functions.dart';
import 'package:project_app_dev/bloc/user/auth_repository.dart';
// import 'package:project_app_dev/screens/splash_1.dart';

part 'signUp_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

   SignUpCubit({
    required this.authRepository,
  }) : super(SignUpState.initial());


  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(state.copyWith(signUpStatus: SignUpStatus.submitting));
    try {
      await authRepository.createUserWithEmailAndPassword(
        email,
        password,
        context,
      );
    } catch (e) {
      emit(state.copyWith(signUpStatus: SignUpStatus.error));
    }
  }
}
