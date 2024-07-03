import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/ui/components/start_clipper.dart';

class CustomBannerTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: StartClipper(),
      child: Material(
        elevation: 40,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 60.h),
          decoration: BoxDecoration(
            color: Color(0xfe380e7f),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ThemeColors.roxoClaro, ThemeColors.roxoPadrao],
            ),
          ),
          height: 360.h,
        ),
      ),
    );
  }
}
