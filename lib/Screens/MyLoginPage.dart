import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// don't forgot to add these two line in main.dart file

///WidgetsFlutterBinding.ensureInitialized();
///await Firebase.initializeApp();


class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key key}) : super(key: key);

  @override
  _MyLoginScreenState createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {

  String status = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Register with email/pass"),
              onPressed: (){
                registerUser(
                  email: "2@gmail.com",
                  password: "123456",
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Login with email/pass"),
              onPressed: (){
                loginUser(
                  email: "1@gmail.com",
                  password: "123456",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void registerUser({String email, String password}) async{

    setState(() {
      status = "Registering user...";
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      setState(() {
        status = "User Registered";
      });
    }).catchError((e){
      FirebaseAuthException error = e as FirebaseAuthException;
      setState(() {
        status = "${error.message}";
      });
    });
  }

  void loginUser({String email, String password}) async{

    setState(() {
      status = "Logging user...";
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      setState(() {
        status = "User Logged In and USER id is ${value.user.uid}";
      });
    }).catchError((e){
      FirebaseAuthException error = e as FirebaseAuthException;
      setState(() {
        status = "${error.message}";
      });
    });
  }

}
