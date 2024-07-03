import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';

class SharedWidgets {
  static Widget progressIndicator(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.h,
              width: 100.h,
              child: CircularProgressIndicator(
                backgroundColor: ThemeColors.roxoPadrao,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            espacoVertical(40.h),
            Text(text,
                textAlign: TextAlign.center,
                style: ThemeTextStyles.getBlack50BoldStyle)
          ],
        ),
      ),
    );
  }

  static Widget espacoVertical(double altura) {
    return SizedBox(
      height: altura,
    );
  }

  static Widget espacoHorizontal(double largura) {
    return SizedBox(
      width: largura,
    );
  }
}
