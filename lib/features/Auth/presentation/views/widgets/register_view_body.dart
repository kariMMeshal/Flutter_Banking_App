import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/custom_gender_button.dart';
import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/choose_city.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/choose_gender.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/register_bottom_sheet.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/register_heading.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController userNameController = TextEditingController();
    TextEditingController birthDateController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneNumController = TextEditingController();
    String? mycity;

    return ListView(
      children: [
        RegisterHeading(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey, width: .2)),
          height: 650,
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: Styles.ktextStyle16),
                CustomTextfield(
                    hint: "your name", myController: userNameController),
                Text("Birth Date", style: Styles.ktextStyle16),
                CustomTextfield(
                  hint: "YYYY-MM-DD",
                  myController: birthDateController,
                  isDatePicker: true,
                ),
                Text("Email", style: Styles.ktextStyle16),
                CustomTextfield(hint: "Email", myController: emailController),
                SizedBox(height: 10),
                ChooseGender(),
                Text("City", style: Styles.ktextStyle16),
                ChooseCity(onChanged: (city) => mycity = city),
                Text("Phone Number", style: Styles.ktextStyle16),
                CustomTextfield(
                  hint: "phone number",
                  myController: phoneNumController,
                  inputType: TextInputType.numberWithOptions(),
                ),
                Text("Password", style: Styles.ktextStyle16),
                CustomTextfield(
                  hint: "Password",
                  myController: passwordController,
                  isHidden: true,
                ),
              ],
            ),
          ),
        ),
        RegisterBottomSheet(),
      ],
    );
  }
}
