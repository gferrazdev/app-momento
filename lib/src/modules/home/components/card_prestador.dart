import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';

class CardPrestador extends StatefulWidget {

  const CardPrestador({ super.key });

  @override
  State<CardPrestador> createState() => _CardPrestadorState();
}

class _CardPrestadorState extends State<CardPrestador> {

   @override
   Widget build(BuildContext context) {
       return SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(160.h),
                    bottomRight: Radius.circular(160.h),
                  ),
                ),
                elevation: 4,
                child: Container(
                  height: 450.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ThemeColors.roxoClaro, ThemeColors.roxoPadrao],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(160.h),
                      bottomRight: Radius.circular(160.h),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 45.w, top: 40.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text('NOME DO PRESTADOR',
                              style: ThemeTextStyles.getWhite50BoldStyle),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text('CÓDIGO',
                              style: ThemeTextStyles.getWhite40BoldStyle),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text('CNPJ',
                              style: ThemeTextStyles.getWhite40BoldStyle),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),                 
                        
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}