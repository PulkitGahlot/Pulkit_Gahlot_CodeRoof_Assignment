import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureList extends StatelessWidget {
  final List<String> features;
  final Color color;
  final String title;

  const FeatureList({
    super.key,
    required this.features,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title badge
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.white,
                border: Border.all(color: color, width: 1.w),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Features
          Column(
            children: features
                .map(
                  (f) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(Icons.check,
                            size: 18, color: color.withOpacity(0.9)),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            f,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
