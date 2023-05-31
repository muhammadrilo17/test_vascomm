import 'package:flutter/material.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_margin.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_radius.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';

class InputCommonCustom extends StatelessWidget {
  final EdgeInsets margin;
  final bool leftDivider;
  final String hintText;
  final TextEditingController? controller;
  const InputCommonCustom({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: AppMargin.size_20),
    this.leftDivider = false,
    this.controller,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.size_20,
        vertical: AppPadding.size_8,
      ),
      margin: margin,
      height: AppSize.size_40,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.size_8)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, AppSize.size_16),
            blurRadius: AppRadius.size_24,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            color: leftDivider ? AppColors.content : AppColors.white,
            width: AppSize.size_1,
          ),
          const SizedBox(width: AppSize.size_3),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: textStyleW400S12.copyWith(
                    color: AppColors.dark,
                    fontFamily: AppString.fontFamilityProximaNova,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: AppPadding.size_11,
                  ),
                ),
                cursorColor: AppColors.primaryBlue50,
                style: textStyleW600S12.copyWith(
                  color: AppColors.title,
                  fontFamily: AppString.fontFamilityProximaNova,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
