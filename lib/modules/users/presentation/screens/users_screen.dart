import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/main.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/user_model.dart';
import 'package:kyrgyz_tourism/modules/users/domain/entities/entity.dart';
import 'package:kyrgyz_tourism/modules/users/presentation/cubit/users_cubit.dart';

@RoutePage()
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required UsersEntity user});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _users = di<UsersCubit>()..getData();
  final List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _users.getData();
        },
      ),
      body: BlocProvider.value(
        value: _users,
        child: BlocBuilder<UsersCubit, BaseState<List<UsersEntity>>>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == StateStatus.error) {
              return Center(child: Text('Error: ${state.model}'));
            } else if (state.status == StateStatus.success) {
              final users = state.model;
              return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.picture),
                    ),
                    title: Text(user.gender),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else {
              return const Center(child: Text('No users found.'));
            }
          },
        ),
      ),
    );
  }
}
