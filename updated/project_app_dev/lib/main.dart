import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_app_dev/bloc/listing/listing_bloc.dart';
import 'package:project_app_dev/bloc/listing/listing_repo.dart';

import 'package:project_app_dev/bloc/signIn/signIn_cubit.dart';
import 'package:project_app_dev/bloc/signUp/signUp_cubit.dart';
import 'package:project_app_dev/bloc/user/auth_bloc.dart';
import 'package:project_app_dev/bloc/user/auth_repository.dart';
import 'package:project_app_dev/firebase_options.dart';

// import 'package:project_app_dev/screens/offer_ride_0.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app_dev/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            firebaseAuth: _firebaseAuth,
            firebaseFirestore: _firebaseFirestore,
          ),
        ),
        RepositoryProvider<ListingRepostory>(
          create: (context) => ListingRepostory(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignInCubit>(
            create: (context) =>
                SignInCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SignUpCubit>(
            create: (context) =>
                SignUpCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                context: context),
          ),
          BlocProvider<ListingBloc>(
            create: (context) => ListingBloc(
                listingRepostory: context.read<ListingRepostory>(),
                context: context),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Splash(),
        ),
      ),
    );
  }
}
