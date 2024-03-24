import 'package:campus_connect/firebase_options.dart';
import 'package:campus_connect/src/bloc/app_event.dart';
import 'package:campus_connect/src/bloc/bloc_consumer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/bloc/app_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()..add(
        const InitializationEvent()
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
            
          ),
          brightness: Brightness.light,
          useMaterial3: true
        ),
        home: const BlocConsumerWidget(),
      ),
    );
  }
}