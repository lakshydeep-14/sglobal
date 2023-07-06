import 'package:contact/features/user_profile/cubit/userprofile_cubit.dart';
import 'package:contact/features/user_profile/presentation/widgets/error.dart';
import 'package:contact/features/user_profile/presentation/widgets/loading.dart';
import 'package:contact/features/user_profile/presentation/widgets/user_profile_tile.dart';
import 'package:contact/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserprofileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocConsumer<UserprofileCubit, UserprofileState>(
        listener: (context, state) {
          state.maybeMap(
              error: (e) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.error))),
              loaded: (e) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Successfully Fetched'))),
              orElse: () => const SizedBox.shrink());
        },
        builder: (context, state) {
          return state.maybeWhen(
            error: (e) => OnError(
              error: e,
              onRetryTap: () => context.read<UserprofileCubit>().getProfile(),
            ),
            orElse: () => const LoadingWid(),
            loaded: (List<UserProfileModel> v) => ListView.builder(
              itemCount: v.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, i) {
                var data = v[i];
                return UserProfileTile(data: data);
              },
            ),
          );
        },
      ),
    );
  }
}
