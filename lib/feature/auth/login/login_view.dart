import 'package:architecture_template/feature/auth/login/view_model/login_view_model.dart';
import 'package:architecture_template/feature/auth/login/view_model/mixin/login_mixin.dart';
import 'package:architecture_template/feature/auth/login/view_model/state/login_state.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:architecture_template/product/widget/product_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 180.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLoginTypesButtons(),
              buildRegisterText(),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const ProjectPadding.scaffoldPadding(),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          Text(
                            'auth.login.title'.tr(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Padding(
                            padding: const ProjectPadding.verticalLager()
                                .copyWith(top: 16.h),
                            child: Text(
                              'auth.login.description'.tr(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          // Email Field
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'auth.login.email'.tr(),
                              prefixIcon: Padding(
                                padding: const ProjectPadding
                                    .inputDecorationPadding(),
                                child: Assets.icons.icMessage.toGetSvg(),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: setEmail,
                          ),
                          SizedBox(height: 20.h),
                          // Password Field
                          BlocBuilder<LoginViewModel, LoginState>(
                            builder: (context, state) {
                              return TextFormField(
                                obscureText: state.isObscure,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'auth.login.password'.tr(),
                                  prefixIcon: Padding(
                                    padding: const ProjectPadding
                                        .inputDecorationPadding(),
                                    child: Assets.icons.icPassword.toGetSvg(),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: changeObscure,
                                    icon: Icon(
                                      state.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                onChanged: setPassword,
                              );
                            },
                          ),

                          // Forgot Password
                          Padding(
                            padding: const ProjectPadding.verticalLager(),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'auth.login.forgotPassword'.tr(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 3,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          BlocBuilder<LoginViewModel, LoginState>(
                            builder: (context, state) {
                              return ProductElevatedButton(
                                isLoading: state.isLoading,
                                title: 'auth.login.loginButton',
                                onPressed: login,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildRegisterText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'auth.login.noAccount'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: () {
              context.router.pushAndPopUntil(
                const RegisterRoute(),
                predicate: (route) => false,
              );
            },
            child: Text(
              'auth.login.signUpLink'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildLoginTypesButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialButton(
            onPressed: () {},
            child: Assets.icons.icGoogle.toGetSvg(),
          ),
          Padding(
            padding: const ProjectPadding.horizontalMedium(),
            child: _buildSocialButton(
              onPressed: () {},
              child: const Icon(
                Icons.apple,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          _buildSocialButton(
            onPressed: () {},
            child: Assets.icons.icFacebook.toGetSvg(),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: child,
      ),
    );
  }
}
