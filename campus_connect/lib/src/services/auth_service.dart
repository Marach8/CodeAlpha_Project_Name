import 'package:campus_connect/src/models/user_model.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  AuthService._sharedInstance();
  static final AuthService _shared = AuthService._sharedInstance();
  factory AuthService() => _shared;

  final authService = FirebaseAuth.instance;
  final cloudStore = FirebaseFirestore.instance;
  User? get currentUser => authService.currentUser;

  Future<String> registerUser({
    required String username,
    required String email,
    required String password
  }) async{
    try{
      await authService.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      final userPayload = UserPayload(
        username: username,
        email: email,
        password: password,
        userId: currentUser!.uid
      );
      await cloudStore.collection(usersString).add(userPayload);
      //await verifyUserEmail();
      await currentUser!.updateDisplayName(username);
      return authSuccessString;
    } on FirebaseAuthException catch(e){
      return e.code;
    }
    catch(e){
      return e.toString();
    }
  }


  Future<String> loginUser({
    required String email,
    required String password
  }) async{
    try{
      await authService.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      if(currentUser!.emailVerified){
        return authSuccessString;
      }
      else{
        await verifyUserEmail();
        return userNotVerifiedString;
      }
    } on FirebaseAuthException catch(e){
      return e.code;
    } catch (e){
      return e.toString();
    }
  }


  Future<String> verifyUserEmail()async{
    try{
      await currentUser!.sendEmailVerification();
      return authSuccessString;
    } on FirebaseAuthException catch(e){
      return e.code;
    } catch (e){
      return e.toString();
    }
  }


  Future<String> logoutUser() async{
    try{
      await authService.signOut();
      return authSuccessString;
    } on FirebaseAuthException catch(e){
      return e.code;
    } catch (e){
      return e.toString();
    }
  }
}