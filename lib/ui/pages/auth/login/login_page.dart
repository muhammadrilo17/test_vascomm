import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';
import 'package:test_vascomm/core/utils/utils.dart';
import 'package:test_vascomm/ui/pages/auth/login/cubit/login_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/login/cubit/password_visibility_cubit.dart';
import 'package:test_vascomm/ui/widgets/button_filled_custom.dart';
import 'package:test_vascomm/ui/widgets/copyright_custom.dart';
import 'package:test_vascomm/ui/widgets/input_common_custom.dart';
import 'package:test_vascomm/ui/widgets/input_password_custom/input_password_common.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginCubit _loginCubit = GetIt.instance<LoginCubit>();
  final PasswordVisibilityCubit _passwordVisibilityCubit =
      GetIt.instance<PasswordVisibilityCubit>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              _loginCubit.moveToMainPage(context);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.size_110),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: textStyleW600S28.copyWith(
                        color: AppColors.primaryBlue800,
                      ),
                      text: AppString.hi,
                      children: <TextSpan>[
                        TextSpan(
                          text: AppString.welcome,
                          style: textStyleW800S28.copyWith(
                            color: AppColors.primaryBlue800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.size_4),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.size_20,
                      ),
                      child: Text(
                        AppString.descriptionLogin,
                        style: textStyleW600S12.copyWith(
                          color: AppColors.primaryBlue50,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          Utils.imagePath('/information_image.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.size_20),
                  child: Text(
                    AppString.email,
                    style: textStyleW600S16.copyWith(color: AppColors.title),
                  ),
                ),
                const SizedBox(height: AppSize.size_16),
                InputCommonCustom(
                  controller: _email,
                  leftDivider: true,
                  hintText: AppString.inputYourEmail,
                ),
                const SizedBox(height: AppSize.size_40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.size_20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.password,
                        style:
                            textStyleW600S16.copyWith(color: AppColors.title),
                      ),
                      Text(
                        AppString.forgotPassword,
                        style: textStyleW600S14.copyWith(
                            color: AppColors.primaryBlue50),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.size_16),
                BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, state) {
                    return InputPasswordCustom(
                      controller: _password,
                      onTap: () {
                        _passwordVisibilityCubit.showHidePassword();
                      },
                      obsocureText: !state,
                      hintText: AppString.inputYourPassword,
                    );
                  },
                ),
                if (state.status == LoginStatus.failure) ...[
                  const SizedBox(height: AppSize.size_8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.size_20,
                    ),
                    child: Text(
                      state.message ?? '',
                      style: textStyleW400S12.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: AppSize.size_40),
                ButtonFilledCustom(
                  onTap: () {
                    _loginCubit.login(_email.text, _password.text);
                  },
                  text: AppString.login,
                  isLoading: state.status == LoginStatus.loading,
                ),
                const SizedBox(height: AppSize.size_30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.dontHaveAccount,
                        style: textStyleW400S14.copyWith(
                          color: AppColors.content,
                          fontFamily: AppString.fontFamilityProximaNova,
                        ),
                      ),
                      const SizedBox(width: AppSize.size_12),
                      InkWell(
                        onTap: () {
                          _loginCubit.moveToRegisterPage(context);
                        },
                        child: Text(
                          AppString.registerNow,
                          style: textStyleW600S16.copyWith(
                            color: AppColors.title,
                            fontFamily: AppString.fontFamilityProximaNova,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.size_40),
                const CopyrightCustom(),
                const SizedBox(height: AppSize.size_40),
              ],
            );
          },
        ),
      ),
    );
  }
}
