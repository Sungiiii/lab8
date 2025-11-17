import 'package:flutter/material.dart';
import 'package:lab8/constants/colors.dart';
import 'package:lab8/constants/text_styles_value.dart';
import 'user_info_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lab8/generated/locale_keys.g.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passFocus = FocusNode();
  final confirmFocus = FocusNode();

  bool showPassword = false;
  bool showConfirmPassword = false;

  OutlineInputBorder myBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.black, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tretiary,
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: Text(
          LocaleKeys.registration_text.tr(),
          style: AppTextStyles.px16yellow,
        ),
        actions: [

          TextButton(
            onPressed: () => context.setLocale(const Locale("en")),
            child: const Text("EN", style: TextStyle(color: AppColors.Indigo)),
          ),
          TextButton(
            onPressed: () => context.setLocale(const Locale("ru")),
            child: const Text("RU", style: TextStyle(color: AppColors.Indigo)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              TextFormField(
                controller: nameController,
                focusNode: nameFocus,
                decoration: InputDecoration(
                  labelText: LocaleKeys.name_text.tr(),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                focusNode: emailFocus,
                decoration: InputDecoration(
                  labelText: LocaleKeys.mail_text.tr(),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " cannot be empty";
                  }
                  if (!value.contains("@") || !value.contains(".")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: phoneController,
                focusNode: phoneFocus,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: LocaleKeys.phone_text.tr(),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " cannot be empty";
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Only digits allowed";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: passController,
                focusNode: passFocus,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: LocaleKeys.passw_text.tr(),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => showPassword = !showPassword);
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " cannot be empty";
                  }
                  if (value.length < 6) {
                    return "At least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: confirmPassController,
                focusNode: confirmFocus,
                obscureText: !showConfirmPassword,
                decoration: InputDecoration(
                  labelText: LocaleKeys.confirm_text.tr(),
                  enabledBorder: myBorder,
                  focusedBorder: myBorder,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => showConfirmPassword = !showConfirmPassword);
                    },
                    icon: Icon(
                      showConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value != passController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoPage(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text(LocaleKeys.submit_text.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
