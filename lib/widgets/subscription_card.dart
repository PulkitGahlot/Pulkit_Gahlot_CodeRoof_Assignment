import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String desc;
  final bool isSelected;
  final Color color;
  final String mixerIcon;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.desc,
    required this.isSelected,
    required this.color,
    required this.mixerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 146.h,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.1) : Colors.white,
        border: Border.all(
          color: isSelected ? color : Colors.grey.shade300,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  )),
                  const Spacer(),
                  SvgPicture.asset(
                    mixerIcon,
                    width: 30.w,
                    height: 30.h,
                  ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                color: color,
              )),
          const Spacer(),
          Text(
            desc,
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
