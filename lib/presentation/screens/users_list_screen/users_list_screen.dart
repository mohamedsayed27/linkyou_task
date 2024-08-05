import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/business_logic/users_cubit/users_cubit.dart';
import 'package:linkyou_task/core/app_theme/app_colors.dart';
import 'package:linkyou_task/core/app_theme/custom_themes.dart';
import 'package:linkyou_task/presentation/widgets/users_list_widgets/cached_network_image_widget.dart';

import '../../widgets/users_list_widgets/user_container_widget.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Users",
          style: CustomThemes.primaryColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => UsersCubit()..initializeUserListScrollController()..getUsersList(),
        child: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, state) {},
          builder: (context, state) {
            UsersCubit cubit = UsersCubit.get(context);
            return state is GetUserLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        controller:cubit.usersListScrollController,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 32.h,
                          ),
                          itemBuilder: (_, index) {
                            return UserDetailsContainer(
                              userModel: cubit.usersList[index],
                            );
                          },
                          separatorBuilder: (_, index) {
                            return SizedBox(
                              height: 16.h,
                            );
                          },
                          itemCount: cubit.usersList.length,
                        ),
                    ),
                    if(state is GetUserPaginationLoading) const Center(child: CircularProgressIndicator.adaptive(),)
                  ],
                );
          },
        ),
      ),
    );
  }
}
