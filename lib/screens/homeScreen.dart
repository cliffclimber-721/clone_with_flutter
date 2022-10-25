import 'package:clone_with_flutter/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({ Key? key }) : super(key:key);

  // 로그인 완료 후 지정한 name, email, profile, uid, token이 보이도록 하는 함수
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text(ref.watch(userProvider)!.email,
        ),
      ),
    );
  }
}