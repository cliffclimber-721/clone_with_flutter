import "package:clone_with_flutter/colors.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(onPressed: () {}, 
        icon: Image.asset("assets/images/google.png", height: 20,),
        label: const Text("Sign in with Google",
          style: TextStyle(
            color: colorBlack,
          ),
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorWhite,
            minimumSize: const Size(150, 50),
            )
          ),
        ),
    );
  }
}