import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/common/widgets/custom_dialog.dart';
import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/Auth/presentation/views/forget_password_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/register_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/login_view_heading.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
        } else if (state is LoginSuccess) {
          customDialog(
            context: context,
            message: "Welcome ${state.userName} you're successfuly logged in ",
            title: "Success",
            dialogType: DialogType.success,
            btnOkOnPress: () =>
                GoRouter.of(context).pushReplacement(HomeView.route),
          );
        } else if (state is LoginFailure) {
          customDialog(
              context: context,
              message: state.errorMessage,
              title: "Error",
              dialogType: DialogType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Column(
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
                          hint: "user@email.com",
                          myController: emailController),
                      const Text("Password", style: Styles.ktextStyle16),
                      CustomTextfield(
                        hint: "Password",
                        myController: passwordController,
                        isHidden: true,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () =>
                            GoRouter.of(context).go(ForgetPasswordView.route),
                        child: Text("Forgort Password ? ",
                            style:
                                Styles.ktextStyle14.copyWith(color: kPurple)),
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            email: emailController.text.trim().toLowerCase(),
                            password: passwordController.text));
                      }
                    },
                    title: "Login",
                    backgroundColor: kPurple,
                    width: MediaQuery.of(context).size.width * .8,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
