import "package:clone_with_flutter/colors.dart";
import 'package:clone_with_flutter/repository/auth_repository.dart';
import 'package:clone_with_flutter/screens/homeScreen.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);
  void signInWithGoogle(WidgetRef ref, BuildContext context) async {
   final sMessenger = ScaffoldMessenger.of(context);
   final errorModel = await ref.read(authRepoProvider).signInWithGoogle();
   final navigator = Navigator.of(context);

   if(errorModel.error == null) {
     ref.read(userProvider.notifier).update((state) => errorModel.data);
     navigator.push(MaterialPageRoute(builder: (context) => const HomeScreen(),
     ),
    );
   } else {
     sMessenger.showSnackBar(
       SnackBar(
         content: Text(errorModel.error!)
         ),
      );
   }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(onPressed: () => signInWithGoogle(ref, context), 
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