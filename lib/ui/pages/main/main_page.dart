import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:test_vascomm/ui/pages/main/cubit/nav_drawer_cubit.dart';
import 'package:test_vascomm/ui/pages/main/cubit/navigation_drawer_cubit.dart';
import 'package:test_vascomm/ui/pages/main/home/home_page.dart';
import 'package:test_vascomm/ui/pages/main/profile/profile_page.dart';
import 'package:test_vascomm/ui/pages/main/settings/settings_page.dart';
import 'package:test_vascomm/ui/widgets/app_bar_custom.dart';
import 'package:test_vascomm/ui/widgets/button_filled_custom.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NavDrawerCubit _navDrawerCubit = GetIt.instance<NavDrawerCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationDrawerCubit, NavigationDrawerState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  AppBarCustom(
                    onTapMenu: () {
                      _navDrawerCubit.openHideDrawer();
                    },
                    onTapNotifications: () {},
                    onTapShoppingCart: () {},
                  ),
                  renderContent(state),
                ],
              ),
              BlocBuilder<NavDrawerCubit, bool>(
                builder: (context, state) {
                  return state ? navigationDrawer(context) : Container();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget navigationDrawer(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: AppColors.transparantBlue,
            child: Column(
              children: [
                const SizedBox(height: AppSize.size_56),
                InkWell(
                  onTap: () {
                    _navDrawerCubit.openHideDrawer();
                  },
                  child: SvgPicture.asset(
                    Utils.iconPath('/close_circular_ic.svg'),
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 12,
          child: Container(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppMargin.size_120),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_42,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Utils.imagePath('/dummy_image.svg'),
                      ),
                      SizedBox(width: AppSize.size_10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: textStyleW700S14.copyWith(
                                color: AppColors.primaryBlue800,
                              ),
                              text: 'Angga ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Praja',
                                  style: textStyleW400S14.copyWith(
                                    color: AppColors.primaryBlue800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.size_2),
                          Text(
                            'Membership LLBK',
                            style: textStyleW600S11.copyWith(
                              fontFamily: AppString.fontFamilityProximaNova,
                              color: AppColors.titleWithOpacity,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.size_32),
                itemNavDrawer(AppString.myProfile),
                const SizedBox(height: AppSize.size_16),
                itemNavDrawer(AppString.settings),
                const SizedBox(height: AppSize.size_40),
                Container(
                  margin: const EdgeInsets.only(left: AppMargin.size_20),
                  child: ButtonFilledCustom(
                    onTap: () {
                      _navDrawerCubit.logout(context);
                    },
                    showIcon: false,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppRadius.size_24),
                    ),
                    text: AppString.logout,
                    width: AppSize.size_170,
                    color: AppColors.primaryRed,
                  ),
                ),
                const SizedBox(height: AppSize.size_80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.followUs,
                      style: textStyleW500S16.copyWith(
                        color: AppColors.title,
                      ),
                    ),
                    const SizedBox(width: AppSize.size_12),
                    SvgPicture.asset(Utils.iconPath('/facebook_ic.svg')),
                    const SizedBox(width: AppSize.size_8),
                    SvgPicture.asset(Utils.iconPath('/instagram_ic.svg')),
                    const SizedBox(width: AppSize.size_8),
                    SvgPicture.asset(Utils.iconPath('/twitter_ic.svg')),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.faq,
                      style: textStyleW700S14.copyWith(
                        color: AppColors.contentOpacity,
                      ),
                    ),
                    const SizedBox(width: AppSize.size_48),
                    Text(
                      AppString.termsAndConditions,
                      style: textStyleW700S14.copyWith(
                        color: AppColors.contentOpacity,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.size_86),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget itemNavDrawer(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.size_42),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textStyleW600S12.copyWith(
                color: AppColors.darkLight,
                fontFamily: AppString.fontFamilityProximaNova,
              ),
            ),
            SvgPicture.asset(Utils.iconPath('/arrow_next_ic.svg')),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget renderContent(NavigationDrawerState state) {
    if (state.status == NavigationDrawerStatus.settings) {
      return const SettingsPage();
    } else if (state.status == NavigationDrawerStatus.profile) {
      return const ProfilePage();
    }
    return HomePage();
  }
}
