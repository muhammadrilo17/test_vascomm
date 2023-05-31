import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:test_vascomm/core/utils/res/app_color.dart';
import 'package:test_vascomm/core/utils/res/app_padding.dart';
import 'package:test_vascomm/core/utils/res/app_size.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';
import 'package:test_vascomm/core/utils/res/text_style.dart';
import 'package:test_vascomm/core/utils/utils.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/password_confirm_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/password_cubit.dart';
import 'package:test_vascomm/ui/pages/auth/register/cubit/register_cubit.dart';
import 'package:test_vascomm/ui/widgets/button_filled_custom.dart';
import 'package:test_vascomm/ui/widgets/copyright_custom.dart';
import 'package:test_vascomm/ui/widgets/input_common_custom.dart';
import 'package:test_vascomm/ui/widgets/input_password_custom/input_password_common.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterCubit _registerCubit = GetIt.instance<RegisterCubit>();
  final PasswordCubit _passwordCubit = GetIt.instance<PasswordCubit>();
  final PasswordConfirmCubit _passwordConfirmCubit =
      GetIt.instance<PasswordConfirmCubit>();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            // if (state.status == LoginStatus.success) {
            //   Navigator.pushNamedAndRemoveUntil(
            //     context,
            //     Pages.home,
            //     (route) => false,
            //   );
            // }
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
                        AppString.descriptionRegister,
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.size_20,
                            ),
                            child: Text(
                              AppString.firstName,
                              style: textStyleW600S16.copyWith(
                                  color: AppColors.title),
                            ),
                          ),
                          const SizedBox(height: AppSize.size_16),
                          InputCommonCustom(
                            controller: _firstName,
                            hintText: AppString.firstName,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSize.size_12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.size_20,
                            ),
                            child: Text(
                              AppString.lastName,
                              style: textStyleW600S16.copyWith(
                                  color: AppColors.title),
                            ),
                          ),
                          const SizedBox(height: AppSize.size_16),
                          InputCommonCustom(
                            controller: _lastName,
                            hintText: AppString.lastName,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.size_40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
                  child: Text(
                    AppString.idNumber,
                    style: textStyleW600S16.copyWith(color: AppColors.title),
                  ),
                ),
                const SizedBox(height: AppSize.size_16),
                InputCommonCustom(
                  controller: _idNumber,
                  hintText: AppString.inputYourIdNumber,
                ),
                const SizedBox(height: AppSize.size_40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
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
                    horizontal: AppPadding.size_20,
                  ),
                  child: Text(
                    AppString.phoneNumber,
                    style: textStyleW600S16.copyWith(color: AppColors.title),
                  ),
                ),
                const SizedBox(height: AppSize.size_16),
                InputCommonCustom(
                  controller: _phoneNumber,
                  leftDivider: true,
                  hintText: AppString.inputYourPhoneNumber,
                ),
                const SizedBox(height: AppSize.size_40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
                  child: Text(
                    AppString.password,
                    style: textStyleW600S16.copyWith(color: AppColors.title),
                  ),
                ),
                const SizedBox(height: AppSize.size_16),
                BlocBuilder<PasswordCubit, bool>(
                  builder: (context, state) {
                    return InputPasswordCustom(
                      controller: _password,
                      onTap: () {
                        _passwordCubit.showHidePassword();
                      },
                      obsocureText: !state,
                      hintText: AppString.inputYourPassword,
                    );
                  },
                ),
                const SizedBox(height: AppSize.size_40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
                  child: Text(
                    AppString.confirmPassword,
                    style: textStyleW600S16.copyWith(color: AppColors.title),
                  ),
                ),
                const SizedBox(height: AppSize.size_16),
                BlocBuilder<PasswordConfirmCubit, bool>(
                  builder: (context, state) {
                    return InputPasswordCustom(
                      controller: _confirmPassword,
                      onTap: () {
                        _passwordConfirmCubit.showHidePassword();
                      },
                      obsocureText: !state,
                      hintText: AppString.inputConfirmPassword,
                    );
                  },
                ),
                const SizedBox(height: AppSize.size_40),
                const ButtonFilledCustom(text: AppString.register),
                const SizedBox(height: AppSize.size_40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.size_20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.haveAccount,
                        style: textStyleW400S14.copyWith(
                          color: AppColors.content,
                          fontFamily: AppString.fontFamilityProximaNova,
                        ),
                      ),
                      const SizedBox(width: AppSize.size_12),
                      InkWell(
                        onTap: () {
                          _registerCubit.moveToLoginPage(context);
                        },
                        child: Text(
                          AppString.loginNow,
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
