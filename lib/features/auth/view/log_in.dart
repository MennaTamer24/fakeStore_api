import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fake_api_app/features/auth/data/auth_repo.dart';
import 'package:fake_api_app/shared/widgets/CustomButton.dart';
import 'package:fake_api_app/shared/widgets/custom_txtfield.dart';
import 'package:fake_api_app/root.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = "johnd";
    passwordController.text = "m38rmF\$";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(27),
            const SizedBox(
              height: 129,
              width: 182,
              child: Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(15),
            CustomTxtfield(
              hint: "Username or Email",
              isPassword: false,
              controller: emailController,
            ),
            const Gap(25),
            CustomTxtfield(
              hint: "Password",
              isPassword: true,
              controller: passwordController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Gap(20),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                bool success = await AuthRepo().logIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Root()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter username and password"),
                    ),
                  );
                }
              },
            ),
            const Gap(40),
            const Center(
              child: Column(
                children: [
                  Text(
                    "- OR Continue with -",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Gap(10),
                  Image(
                    image: AssetImage("assets/social/social.png"),
                    height: 56,
                    width: 140,
                  ),
                  Gap(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
