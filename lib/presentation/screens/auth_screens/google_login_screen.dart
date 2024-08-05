import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkyou_task/presentation/widgets/users_list_widgets/create_user_dialog.dart';

import '../../../business_logic/auth_cubit/auth_cubit.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';

class GoogleLoginScreen extends StatelessWidget {

  const GoogleLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocProvider(
            create: (context) => AuthCubit(),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if(state is GoogleLoginSuccess){
                  if(state.googleSignInAccount!=null){
                    showDialog(
                      context: context,
                      builder: (_) => CreateUserDialog(
                        userName: state.googleSignInAccount?.displayName??"",
                      ),
                    );
                  }
                }
              },
              builder: (context, state) {
                AuthCubit cubit = AuthCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgPath.google,
                      height: 160.h,
                      width: 160.w,
                    ),
                    SizedBox(
                      height: 62.h,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        cubit.googleSignIn();

                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.greyColor71,
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          side: BorderSide(
                              color: AppColors.userContainerBorderColor,
                              width: 1.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgPath.google,
                            height: 24.h,
                            width: 24.w,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            "Sign in With Google",
                            style: CustomThemes.darkGreyColorTextTheme(context)
                                .copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
