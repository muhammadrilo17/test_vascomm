import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_margin.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';
import 'package:test_vascomm/core/utils/utils.dart';

class CardOverlayImageCustom extends StatelessWidget {
  final String? imagePath;
  final double? imageWidth;
  final EdgeInsets? imageMargin;
  final String? firstText;
  final String? secondText;
  final String? description;
  final Widget? buttonWidget;
  final Alignment imageAlignment;
  final double? contentStartMargin;
  final double? contentEndMargin;
  const CardOverlayImageCustom({
    super.key,
    this.imagePath,
    this.imageWidth = AppSize.size_100,
    this.imageMargin,
    this.firstText = '',
    this.secondText = '',
    this.description,
    this.buttonWidget,
    this.imageAlignment = Alignment.topRight,
    this.contentStartMargin = 0,
    this.contentEndMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppMargin.size_20,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppPadding.size_16),
            margin: const EdgeInsets.only(
              top: AppMargin.size_24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowTitle,
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: contentStartMargin),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: textStyleW600S18.copyWith(
                            color: AppColors.primaryBlue800,
                          ),
                          text: firstText,
                          children: <TextSpan>[
                            TextSpan(
                              text: secondText,
                              style: textStyleW600S32.copyWith(
                                color: AppColors.primaryBlue800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSize.size_8),
                      Text(
                        description ?? '',
                        style: textStyleW400S12.copyWith(
                          color: AppColors.primaryBlue50,
                          fontFamily: AppString.fontFamilityProximaNova,
                        ),
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSize.size_12),
                      if (buttonWidget != null) buttonWidget!,
                    ],
                  ),
                ),
                SizedBox(width: contentEndMargin),
              ],
            ),
          ),
          if (imagePath != null) ...[
            Container(
              margin: imageMargin,
              child: Align(
                alignment: imageAlignment,
                child: SvgPicture.asset(
                  Utils.imagePath(imagePath!),
                  height: imageWidth,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
