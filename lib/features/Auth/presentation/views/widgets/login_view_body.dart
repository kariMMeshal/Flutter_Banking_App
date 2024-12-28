import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/views/register_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/login_view_heading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        LoginViewHeading(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey, width: .4)),
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 8.5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email", style: Styles.ktextStyle16),
                CustomTextfield(
                    hint: "user@email.com", myController: emailController),
                const Text("Password", style: Styles.ktextStyle16),
                CustomTextfield(
                  hint: "Password",
                  myController: passwordController,
                  isHidden: true,
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Text("Forgort Password ? ",
                      style: Styles.ktextStyle14.copyWith(color: kPurple)),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => GoRouter.of(context).go(RegisterView.route),
              child: Text("Dont have an account ? ",
                  style: Styles.ktextStyle14.copyWith(color: kPurple)),
            ),
            SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              title: "Login",
              backgroundColor: kPurple,
              width: MediaQuery.of(context).size.width * .8,
            ),
          ],
        ),
      ],
    );
  }
}
