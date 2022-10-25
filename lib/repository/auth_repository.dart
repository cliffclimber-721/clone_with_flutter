import 'dart:convert';
import 'package:clone_with_flutter/models/error_model.dart';
import 'package:clone_with_flutter/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:clone_with_flutter/constants.dart';

final authRepoProvider = Provider(
  (ref) => AuthRepository(
    googleSignIn: GoogleSignIn(),
    client: Client()
    )
  );

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final Client _client;
  AuthRepository({
    required GoogleSignIn googleSignIn,
    required Client client
  }) : _googleSignIn = googleSignIn, _client = client;

  Future<ErrorModel> signInWithGoogle() async {
    ErrorModel error = ErrorModel(error: "Unexpected Error!", data: null);
    try {
      final user = await _googleSignIn.signIn();
      if(user != null) {
          final userAccount = UserModel(
          name: user.displayName!, 
          email: user.email, 
          profile: user.photoUrl!, 
          token: "", 
          uid: ""
        );
        var res = await _client.post(
          Uri.parse('$host/api/signup'),
          body: userAccount.toJson(),
          headers: {
            "Content-Type": "application/json; charset=UTF-8"
          });
        switch(res.statusCode) {
          case 200 :
          final newUser = userAccount.copyWith(
            uid: jsonDecode(res.body)["user"]["_id"],
          );
          error = ErrorModel(error: null, data: newUser);
          break;
        }
      }
    } catch(e) {
        error = ErrorModel(
          error: e.toString(),
          data: null
        );
      }
      return error;
    }
}