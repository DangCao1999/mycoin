import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycoin/cubit/user/cubit/user_cubit.dart';
import 'package:mycoin/data/model/user.dart';

class MyCoinScreen extends StatelessWidget {
  const MyCoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          child: ElevatedButton(
            child: const Text("save users"),
            onPressed: () => {
              context.read<UserCubit>().saveUser(User("1", "a", "b"))
            },
          ),
        );
      },
    );
  }
}
