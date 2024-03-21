import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable 
abstract class AppState{
  final String id;
  final bool? isLoading;
  final String? operation;
  AppState({
    this.isLoading,
    this.operation
  }): id = const Uuid().v4();

  @override 
  bool operator ==(covariant AppState other)
    => identical(this, other) && 
    id == other.id;

  @override 
  int get hashCode => id.hashCode;
}


@immutable 
class InLandingScreenState extends AppState{
  InLandingScreenState({
    bool? isLoading,
    String? operation
}): super(
        isLoading: isLoading,
        operation: operation
  );
}


@immutable 
class InSignInAndSignUpScreenState extends AppState{
  InSignInAndSignUpScreenState();
}


@immutable 
class InHomeScreenState extends AppState{
  InHomeScreenState();
}