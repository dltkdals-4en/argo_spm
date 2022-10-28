import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int loginHistory = 0;
  TextEditingController email = TextEditingController();
  String emailId = '';
  TextEditingController pw = TextEditingController();
  bool pwObscure = true;
  bool isSignIn = false;

  void changePwObscure() {
    (pwObscure) ? pwObscure = false : pwObscure = true;
    print(pwObscure);
    notifyListeners();
  }

  String? emailVal(String? value) {
    print(value);
    if (value == null || value.isEmpty) {
      notifyListeners();
      return '이메일을 입력해주세요.';
    }
    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      notifyListeners();
      return '잘못된 이메일 형식입니다.';
    }
    notifyListeners();
    return null;
  }

  String? pwVal(String? value) {
    print(value);
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    } else {
      return null;
    }
  }

  int prepareUserInfo() {
    print('uid : ${auth.currentUser?.uid}');
    if (auth.currentUser?.uid == null) {
      loginHistory = 1;

    } else {
      loginHistory = 2;

    }
    return loginHistory;
  }

  Future<void> autoSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = auth.currentUser!.email!;
    String password = await prefs.getString('savedPw')!;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('login Success');
        isSignIn = true;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      print('firebase E = $e');
    }
  }

  Future<bool> signIn(String email, String pw) async {
    try {
      final credential = await auth
          .signInWithEmailAndPassword(email: email, password: pw)
          .then((value) {
        isSignIn = true;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
      return false;
    }
    // authPersistence(); // 인증 영속
    return true;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void saveEmail(String? newValue) {
    emailId = newValue!;
    notifyListeners();
  }
}
