import 'package:bloc_practice/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_practice/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc,InternetState>(
            listener: (context, state) {
              if(state is InternetGainedState){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.internetConnectedText)));
              }else if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.internetNotConnectedText)));
              }
            },
            builder: (context,state) {
                  if(state is InternetGainedState){
                    return const Text(AppStrings.connectedText);
                  } else if(state is InternetLostState){
                    return const Text(AppStrings.notConnectedText);
                  }else{
                    return const Text(AppStrings.loadingText);
                  }
            }
          ),
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
}
