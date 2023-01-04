import 'package:bloc_practice/constants/app_colors.dart';
import 'package:bloc_practice/utils/ui_helper.dart';
import 'package:bloc_practice/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(title: AppStrings.signInWithEmailText),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                const TextWidget(title: AppStrings.errorText,color: AppColors.redColor,),

                UiHelper.horizontalSizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.emailAddressText,
                  ),
                ),
                UiHelper.horizontalSizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.passwordText,
                  ),
                ),
                UiHelper.horizontalSizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  color: AppColors.greyColor,
                  onPressed: () {},
                  child: const TextWidget(
                    title: AppStrings.signInText,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
