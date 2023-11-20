import 'package:flutter/material.dart';
import '../../../../../../../core/constant/custom_text_field_auth.dart';
import '../../../../regester/presentation/views/register_view.dart';

// ignore: must_be_immutable
class DontHaveAccount extends StatelessWidget {
  DontHaveAccount({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text(
            'Don not have an account?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          customTextBottom(
            function: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterView(),
                ),
              );
            },
            text: 'Register',
          ),
        ],
      ),
    );
  }
}
