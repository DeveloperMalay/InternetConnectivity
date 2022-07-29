import 'package:connectiity/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected!'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Lost Internet Connectinon!'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state == InternetState.gained) {
              return const Text('Connected');
            } else if (state == InternetState.lost) {
              return const Text('Lost Connection');
            } else {
              return const Text('Loading...');
            }
          },
        )
            // child: BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //     if (state is InternetgainedState) {
            //       return const Text('Connected');
            //     } else if (state is InternetlostState) {
            //       return const Text('Lost Connection');
            //     } else {
            //       return const Text('Loading...');
            //     }
            //   },
            // ),
            ),
      ),
    );
  }
}
