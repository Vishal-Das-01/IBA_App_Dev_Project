import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:project_app_dev/auth/firebase_functions.dart';
// ignore: unused_import
import 'package:project_app_dev/bloc/user/auth_repository.dart';

part 'signIn_state.dart';

class SignInCubit extends Cubit<SignInState> {
    final AuthRepository authRepository;

   SignInCubit({
    required this.authRepository,
  }) : super(SignInState.initial());

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(state.copyWith(
      signInStatus: SignInStatus.submitting,
    ));
    try {
      await authRepository.signInWithEmailAndPassword(email, password,context);
      emit(state.copyWith(
        signInStatus: SignInStatus.success,
      ));
    }  catch (e) {
      emit(state.copyWith(signInStatus: SignInStatus.error));
    }
  }

}