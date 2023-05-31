import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/utils.dart';

class AppBarCustom extends StatelessWidget {
  final VoidCallback? onTapMenu;
  final VoidCallback? onTapShoppingCart;
  final VoidCallback? onTapNotifications;
  const AppBarCustom({
    super.key,
    this.onTapMenu,
    this.onTapShoppingCart,
    this.onTapNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppPadding.size_20,
        right: AppPadding.size_20,
        bottom: 0,
        top: AppSize.size_36,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (onTapMenu != null) onTapMenu!();
            },
            child: SvgPicture.asset(Utils.iconPath('/menu_ic.svg')),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (onTapShoppingCart != null) onTapShoppingCart!();
            },
            child: SvgPicture.asset(Utils.iconPath('/shopping_cart_ic.svg')),
          ),
          const SizedBox(width: AppSize.size_32),
          InkWell(
            onTap: () {
              if (onTapNotifications != null) onTapNotifications!();
            },
            child: SvgPicture.asset(Utils.iconPath('/notifications_ic.svg')),
          ),
        ],
      ),
    );
  }
}
