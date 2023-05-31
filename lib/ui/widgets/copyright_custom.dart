import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';
import 'package:test_vascomm/core/utils/utils.dart';

class CopyrightCustom extends StatelessWidget {
  const CopyrightCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Utils.iconPath('/copyright_outline_ic.svg')),
        const SizedBox(width: AppSize.size_8),
        Text(
          AppString.copyright,
          style: textStyleW600S12.copyWith(
            color: AppColors.content,
            fontFamily: AppString.fontFamilityProximaNova,
          ),
        ),
      ],
    );
  }
}
