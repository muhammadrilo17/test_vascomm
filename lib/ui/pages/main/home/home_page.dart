import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_margin.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_radius.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';
import 'package:test_vascomm/core/utils/utils.dart';
import 'package:test_vascomm/ui/pages/main/home/cubit/home_cubit.dart';
import 'package:test_vascomm/ui/widgets/button_filled_custom.dart';
import 'package:test_vascomm/ui/widgets/card_overlay_image_custom.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeCubit _homeCubit = GetIt.instance<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: AppSize.size_30),
          const CardOverlayImageCustom(
            firstText: AppString.solution,
            secondText: AppString.yourHealth,
            contentEndMargin: AppMargin.size_80,
            description: AppString.informationHealthyDescription,
            imagePath: '/home_info_image.svg',
            buttonWidget: ButtonFilledCustom(
              text: AppString.more,
              margin: EdgeInsets.zero,
              showIcon: false,
              width: 130,
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.size_12,
                vertical: AppPadding.size_8,
              ),
            ),
          ),
          const SizedBox(height: AppSize.size_20),
          CardOverlayImageCustom(
            firstText: AppString.specialService,
            description: AppString.informationDrugs,
            imagePath: '/drugs_image.svg',
            contentEndMargin: AppMargin.size_80,
            imageMargin: const EdgeInsets.only(
              right: AppMargin.size_18,
            ),
            buttonWidget: Row(
              children: [
                Text(
                  AppString.testRegist,
                  style: textStyleW700S14.copyWith(
                    color: AppColors.title,
                  ),
                ),
                const SizedBox(width: AppSize.size_8),
                SvgPicture.asset(
                  Utils.iconPath('/arrow_right_ic.svg'),
                  height: AppSize.size_16,
                  width: AppSize.size_16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.title,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.size_20),
          CardOverlayImageCustom(
            firstText: AppString.trackChecking,
            description: AppString.informationTrackChecking,
            imagePath: '/find_image.svg',
            imageWidth: AppSize.size_80,
            imageMargin: const EdgeInsets.only(left: AppSize.size_20),
            imageAlignment: Alignment.topLeft,
            contentStartMargin: AppMargin.size_120,
            buttonWidget: Row(
              children: [
                Text(
                  AppString.track,
                  style: textStyleW700S14.copyWith(
                    color: AppColors.title,
                  ),
                ),
                const SizedBox(width: AppSize.size_8),
                SvgPicture.asset(
                  Utils.iconPath('/arrow_right_ic.svg'),
                  height: AppSize.size_16,
                  width: AppSize.size_16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.title,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.size_40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.size_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: AppSize.size_40,
                  width: AppSize.size_40,
                  padding: const EdgeInsets.all(AppSize.size_12),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(190, 190, 190, 0.16),
                        offset: Offset(0, 16),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    Utils.iconPath('/filter_ic.svg'),
                  ),
                ),
                const SizedBox(width: AppSize.size_30),
                Flexible(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadowSearch,
                          offset: Offset(0, 16),
                          blurRadius: 24,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(AppRadius.size_30),
                    ),
                    child: TextField(
                      style: textStyleW400S16.copyWith(
                        fontFamily: AppString.fontFamilityProximaNova,
                        color: AppColors.title,
                      ),
                      decoration: InputDecoration(
                        hintText: AppString.search,
                        border: InputBorder.none,
                        hintStyle: textStyleW400S16.copyWith(
                          fontFamily: AppString.fontFamilityProximaNova,
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: AppPadding.size_16,
                          right: AppPadding.size_16,
                          bottom: AppPadding.size_8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _homeCubit.productItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: AppMargin.size_20,
                    top: AppMargin.size_40,
                    bottom: AppMargin.size_40,
                    right: index == _homeCubit.productItems.length - 1
                        ? AppMargin.size_20
                        : 0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.size_24,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadewBadge,
                        offset: Offset(0, 16),
                        blurRadius: 24,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(AppRadius.size_30),
                  ),
                  child: Center(
                    child: Text(
                      _homeCubit.productItems[index],
                      style: textStyleW600S12.copyWith(
                        color: AppColors.title,
                        fontFamily: AppString.fontFamilityProximaNova,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSize.size_40),
          // Expanded(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 10,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
