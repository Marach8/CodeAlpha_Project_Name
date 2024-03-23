import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable 
abstract class AppState{
  final String id;
  final bool? isLoading, showNotification;
  final String? operation, notification;
  AppState({
    this.isLoading,
    this.operation,
    this.showNotification,
    this.notification
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
    super.isLoading,
    super.operation
  });
}


@immutable 
class InSignInAndSignUpScreenState extends AppState{
  InSignInAndSignUpScreenState({
    super.isLoading,
    super.operation,
    super.notification,
    super.showNotification
  });

  InSignInAndSignUpScreenState copyState({
    String? operation,
    String? notification,
    bool? isLoading,
    bool? showNotification
  }) =>
    InSignInAndSignUpScreenState(
      isLoading: isLoading ?? this.isLoading,
      notification: notification ?? this.notification,
      operation: operation ?? this.operation,
      showNotification: showNotification ?? this.showNotification
    );
}


@immutable 
class InHomeScreenState extends AppState{
  InHomeScreenState();
}