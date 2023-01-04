import 'package:bloc_practice/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_practice/bloc/internet_bloc/internet_state.dart';
import 'package:bloc_practice/constants/app_colors.dart';
import 'package:bloc_practice/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetStates>(
              listener: (context, state) {
                if (state == InternetStates.gained) {
                  showSnackBar(
                    context: context,
                    content: AppStrings.internetConnectedText,
                    color: AppColors.greenColor,
                  );
                } else if (state == InternetStates.lost) {
                  showSnackBar(
                    context: context,
                    content: AppStrings.internetNotConnectedText,
                    color: AppColors.redColor,
                  );
                }
              }, builder: (context, state) {
            if (state == InternetStates.gained) {
              return const Text(AppStrings.connectedText);
            } else if (state == InternetStates.lost) {
              return const Text(AppStrings.notConnectedText);
            } else {
              return const Text(AppStrings.loadingText);
            }
          }),
          // BlocConsumer<InternetBloc, InternetState>(
          //     listener: (context, state) {
          //   if (state is InternetGainedState) {
          //     showSnackBar(
          //       context: context,
          //       content: AppStrings.internetConnectedText,
          //       color: AppColors.greenColor,
          //     );
          //   } else if (state is InternetLostState) {
          //     showSnackBar(
          //       context: context,
          //       content: AppStrings.internetNotConnectedText,
          //       color: AppColors.redColor,
          //     );
          //   }
          // }, builder: (context, state) {
          //   if (state is InternetGainedState) {
          //     return const Text(AppStrings.connectedText);
          //   } else if (state is InternetLostState) {
          //     return const Text(AppStrings.notConnectedText);
          //   } else {
          //     return const Text(AppStrings.loadingText);
          //   }
          // }),
          // BlocBuilder<InternetBloc,InternetState>(
          //   builder: (context,state) {
          //     /// == means to check value
          //     /// is means to check data type
          //     if(state is InternetGainedState){
          //       return const Text(AppStrings.connectedText);
          //     } else if(state is InternetLostState){
          //       return const Text(AppStrings.notConnectedText);
          //     }else{
          //       return const Text(AppStrings.loadingText);
          //     }
          //
          //   }
          // ),
        ),
      ),
    );
  }

  void showSnackBar(
      {required BuildContext context,
      required String content,
      required Color color}) {
    final snackBar = SnackBar(
      content: Text(content),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
