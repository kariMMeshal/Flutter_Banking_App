// ignore_for_file: unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_dialog.dart';
import 'package:banking_app2/core/common/widgets/custom_snack_bar.dart';
import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/core/utils/Validator.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/Auth/presentation/views/login_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/choose_city_field.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/choose_gender_field.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/register_bottom_sheet.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/register_heading.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final userNameController = TextEditingController();
    final birthDateController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneNumController = TextEditingController();
    final salaryController = TextEditingController();
    String? mycity;
    bool isGenderValid = false;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
        } else if (state is RegisterSuccess) {
          customDialog(
            context: context,
            message:
                'Welcome ${state.userName}\n your account is successfuly created kindly check your mail and verify it then Sign in',
            title: 'Success',
            dialogType: DialogType.success,
            btnOkOnPress: () =>
                GoRouter.of(context).pushReplacement(LoginView.route),
          );
        } else if (state is RegisterFailure) {
          customDialog(
              context: context,
              message: state.errorMessage,
              title: 'Error',
              dialogType: DialogType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: (state is RegisterLoading),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const RegisterHeading(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: kborder, width: .5)),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 8.5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Name', style: Styles.ktextStyle16),
                      CustomTextfield(
                          validator: Validator.validateName,
                          hint: 'Enter your Full name',
                          myController: userNameController),
                      const Text('Birth Date', style: Styles.ktextStyle16),
                      CustomTextfield(
                        validator: Validator.validateBirthDate,
                        hint: 'YYYY-MM-DD',
                        myController: birthDateController,
                        isDatePicker: true,
                      ),
                      const Text('Email', style: Styles.ktextStyle16),
                      CustomTextfield(
                          validator: Validator.validateEmail,
                          hint: 'user@email.com',
                          myController: emailController),
                      const SizedBox(height: 10),
                      ChooseGenderField(
                          onValidated: (isValid) => isGenderValid = isValid),
                      const Text('City', style: Styles.ktextStyle16),
                      ChooseCityField(onChanged: (city) => mycity = city),
                      const Text('Phone Number', style: Styles.ktextStyle16),
                      CustomTextfield(
                        validator: Validator.validatePhoneNumber,
                        hint: '015........',
                        myController: phoneNumController,
                        inputType: TextInputType.phone,
                      ),
                      const Text('Current Salary', style: Styles.ktextStyle16),
                      CustomTextfield(
                        validator: Validator.validateSalary,
                        inputType: TextInputType.phone,
                        hint: '\$5000...',
                        myController: salaryController,
                      ),
                      const Text('Password', style: Styles.ktextStyle16),
                      CustomTextfield(
                        validator: Validator.validatePassword,
                        hint: 'Password',
                        myController: passwordController,
                        isHidden: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () => GoRouter.of(context).go(LoginView.route),
                child: Text(
                  textAlign: TextAlign.left,
                  '   Already Have An Account ? ',
                  style: Styles.ktextStyle16.copyWith(color: kPurple),
                ),
              ),
              const SizedBox(height: 20),
              RegisterBottomSheet(
                  onbacktap: () =>
                      GoRouter.of(context).go(OnBoardingView.route),
                  onRegistertap: () {
                    handleRegister(
                        formKey,
                        isGenderValid,
                        context,
                        salaryController,
                        emailController,
                        passwordController,
                        userNameController,
                        mycity,
                        phoneNumController,
                        birthDateController);
                  }),
            ],
          ),
        );
      },
    );
  }

  void handleRegister(
      GlobalKey<FormState> formKey,
      bool isGenderValid,
      BuildContext context,
      TextEditingController salaryController,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController userNameController,
      String? mycity,
      TextEditingController phoneNumController,
      TextEditingController birthDateController) {
    if (formKey.currentState!.validate()) {
      if (!isGenderValid) {
        customSnackBar(
          context,
          title: ' Please Choose Your Gender',
        );
      } else {
        final num usersalary = num.parse(salaryController.text.trim());
        BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
          salary: usersalary,
          emailAddress: emailController.text.trim().toLowerCase(),
          password: passwordController.text.trim(),
          username: userNameController.text.trim(),
          city: mycity!,
          phoneNumber: phoneNumController.text.trim(),
          birthDate: birthDateController.text,
        ));
      }
    }
  }
}
