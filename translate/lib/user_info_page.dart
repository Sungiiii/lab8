import 'package:flutter/material.dart';
import 'package:lab8/constants/colors.dart';
import 'package:lab8/constants/text_styles_value.dart';

class UserInfoPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const UserInfoPage({super.key, 
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tretiary,
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryColor,
        title: Text("User Info"),
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name:",
                style: AppTextStyles.supersmall
              ),
              Text(
                name,
                style: AppTextStyles.normal
              ),
              SizedBox(height: 15),

              Text(
                "Email:",
                style: AppTextStyles.supersmall
              ),
              Text(
                email,
                style: AppTextStyles.normal
              ),
              SizedBox(height: 15),

              Text(
                "Phone:",
                style: AppTextStyles.supersmall
              ),
              Text(
                phone,
                style: AppTextStyles.normal
              ),
            ],
          ),
        ),
      ),
    );
  }
}
