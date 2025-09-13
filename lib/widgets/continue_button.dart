import 'package:coderoofs_flutter_internship_assignment/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueButton extends StatelessWidget {
  final Color color;
  final String price;
  final String title;

  const ContinueButton({
    super.key,
    required this.color,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(0.7),
          ], 
        ),
        borderRadius: BorderRadius.circular(40.r),

      ),
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavigation())
          );
        },
        style: TextButton.styleFrom(
          // iconAlignment: IconAlignment.start,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/mixer_icon.svg",
          color: Colors.white.withOpacity(0.8),
          width: 24.w,
          height: 24.h,
        ),
        label: Text(
          "Continue – $price total",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
