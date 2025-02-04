import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/common/widgets/custom_dialog.dart';
import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/Auth/presentation/views/login_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/foget_pass_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetPassSuccess) {
          customDialog(
            context: context,
            message: 'a reset password mail has been sent to you',
            title: 'Reset Password',
            dialogType: DialogType.info,
            btnOkOnPress: () => GoRouter.of(context).go(LoginView.route),
          );
        } else if (state is ResetPassFailure) {
          customDialog(
              context: context,
              message: state.errorMessage,
              title: 'Reset Password',
              dialogType: DialogType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPassLoading,
          child: Column(
            children: [
              const ForgetPassHeading(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey, width: .4)),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: CustomTextfield(
                    hint: 'user@gmail.com',
                    myController: emailController,
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthBloc>(context).add(ResetPassEvent(
                        email: emailController.text.trim().toLowerCase()));
                  }
                },
                title: 'Send',
                backgroundColor: kPurple,
                width: MediaQuery.of(context).size.width * .8,
              ),
            ],
          ),
        );
      },
    );
  }
}
