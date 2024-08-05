import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/business_logic/users_cubit/users_cubit.dart';
import 'package:linkyou_task/core/app_router/screens_name.dart';
import 'package:linkyou_task/core/app_theme/app_colors.dart';
import 'package:linkyou_task/core/parameters/user_parameters.dart';
import 'package:linkyou_task/presentation/widgets/shared_widgets/custom_elevated_button.dart';
import 'package:linkyou_task/presentation/widgets/shared_widgets/custom_outlined_button.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/constants.dart';

class CreateUserDialog extends StatelessWidget {
  final String userName;

  const CreateUserDialog({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SizedBox(
                height: 24.h,
                width: 24.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: AppColors.greyColor71,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              "You will create a User with name.",
              style: CustomThemes.grey71ColorTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              userName,
              style: CustomThemes.darkGreyColorTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 32.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderColor: AppColors.primaryColor,
                  borderRadius: 8,
                  foregroundColor: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 16.w,
                ),
                BlocProvider.value(
                  value: UsersCubit(),
                  child: BlocConsumer<UsersCubit, UsersState>(
                    listener: (context, state) {
                      if(state is AddUserLoading){
                        showProgressIndicator(context);
                      }else if(state is AddUserSuccess){
                        showToast(errorType: 0, message: "User Added Successfully");
                        Navigator.pushNamedAndRemoveUntil(context, ScreenName.usersListScreen, (route)=>false);
                      }else if(state is AddUserError){
                        Navigator.pop(context);
                        showToast(errorType: 1, message: "Failed To add user");
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: "Continue",
                        onPressed: () {
                          UsersCubit.get(context).addUser(
                            addUserParameters: AddUserParameters(
                              name: userName,
                              job: "Leader",
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
