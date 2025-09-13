import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// A reusable, styled list tile for settings screens.
///
/// It includes a leading icon, a title, a subtitle, and a trailing
/// arrow, matching the standard iOS/Android settings UI pattern.
class ReusableListTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const ReusableListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: BorderDirectional(bottom: BorderSide(width: 0.4, color: Colors.grey, ))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              // Leading Icon
              SvgPicture.asset(
                icon,
                fit: BoxFit.cover,
                width: 28.w,
                height: 28.h,
                color: Colors.black,
              ),
              SizedBox(width: 16.w),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Trailing Arrow Icon
              Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
