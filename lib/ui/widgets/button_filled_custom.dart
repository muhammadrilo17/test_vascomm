import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_margin.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_radius.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';
import 'package:test_vascomm/core/utils/utils.dart';

class ButtonFilledCustom extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool showIcon;
  final Color color;
  final BorderRadius borderRadius;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  const ButtonFilledCustom({
    super.key,
    this.text = '',
    this.onTap,
    this.isLoading = false,
    this.color = AppColors.title,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(AppRadius.size_8),
    ),
    this.showIcon = true,
    this.width = double.infinity,
    this.margin = const EdgeInsets.symmetric(horizontal: AppMargin.size_20),
    this.padding = const EdgeInsets.symmetric(
      vertical: AppPadding.size_12,
      horizontal: AppPadding.size_20,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(29, 51, 79, 0.24),
              offset: Offset(0, 16),
              blurRadius: 24,
            ),
          ],
        ),
        height: AppSize.size_48,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showIcon
                  ? const SizedBox(width: AppSize.size_24)
                  : const SizedBox(),
              Text(
                text,
                style: textStyleW600S16.copyWith(
                  color: AppColors.white,
                  fontFamily: AppString.fontFamilityProximaNova,
                ),
              ),
              isLoading
                  ? const SizedBox(
                      height: AppSize.size_24,
                      width: AppSize.size_24,
                      child: CircularProgressIndicator(),
                    )
                  : showIcon
                      ? SvgPicture.asset(
                          Utils.iconPath('/arrow_right_ic.svg'),
                          height: AppSize.size_24,
                          width: AppSize.size_24,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        )
                      : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
