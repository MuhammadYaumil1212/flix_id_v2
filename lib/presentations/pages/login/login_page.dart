import 'package:flix_id/config/navigation/app_navigation.dart';
import 'package:flix_id/domain/usecases/login/login_usecase.dart';
import 'package:flix_id/presentations/pages/home_page/home_page.dart';
import 'package:flix_id/presentations/providers/usecases/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LoginUsecase login = ref.watch(loginUsecaseProvider);
            login(
              LoginParams(email: "demo@gmail.com", password: "123456"),
            ).then(
              (result) => {
                if (result.isSuccess)
                  {
                    SnackBar(
                      content: Text("Login success: ${result.resultValue}"),
                    ),
                    AppNavigator.push(
                      context,
                      HomePage(name: result.resultValue!),
                    ),
                  }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login failed: ${result.errorMessage}"),
                      ),
                    ),
                  },
              },
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
