
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/data/models/users_models/get_users_list_model.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'cached_network_image_widget.dart';

class UserDetailsContainer extends StatelessWidget {
  final UserModel userModel;
  const UserDetailsContainer({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
        border: Border.all(
          color: AppColors.userContainerBorderColor,
          width: 1.w,
        ),
      ),
      child: Row(

        children: [
          Container(
            height: 56.h,
            width: 56.w,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImageWidget(
              imagePath: userModel.avatar??"",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${userModel.firstName??""} ${userModel.lastName??""}",
                  style: CustomThemes.darkGreyColorTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  userModel.email??"",
                  style: CustomThemes.grey71ColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}