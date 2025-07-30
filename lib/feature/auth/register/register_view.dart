import 'package:architecture_template/feature/auth/register/view_model/mixin/register_mixin.dart';
import 'package:architecture_template/feature/auth/register/view_model/register_view_model.dart';
import 'package:architecture_template/feature/auth/register/view_model/state/register_state.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:architecture_template/product/widget/product_elevated_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerViewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('auth.register.title'.tr(),
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Padding(
                            padding: const ProjectPadding.verticalLager()
                                .copyWith(top: 16.h),
                            child: Text(
                              'auth.register.description'.tr(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'auth.register.name'.tr(),
                              prefixIcon: Padding(
                                padding: const ProjectPadding
                                    .inputDecorationPadding(),
                                child: Assets.icons.icMessage.toGetSvg(),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: setUserName,
                          ),
                          Padding(
                            padding: const ProjectPadding.verticalMedium(),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'auth.register.email'.tr(),
                                prefixIcon: Padding(
                                  padding: const ProjectPadding
                                      .inputDecorationPadding(),
                                  child: Assets.icons.icMessage.toGetSvg(),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: setEmail,
                            ),
                          ),
                          // Password Field
                          BlocBuilder<RegisterViewModel, RegisterState>(
                            builder: (context, state) {
                              return TextFormField(
                                controller: passwordTextEditingController,
                                obscureText: state.isObscure,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'auth.register.password'.tr(),
                                  prefixIcon: Padding(
                                    padding: const ProjectPadding
                                        .inputDecorationPadding(),
                                    child: Assets.icons.icPassword.toGetSvg(),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: changeObscure,
                                    icon: Icon(
                                      state.isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                onChanged: setPassword,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // Confirm Password Field
                          BlocBuilder<RegisterViewModel, RegisterState>(
                            builder: (context, state) {
                              return TextFormField(
                                controller: passwordConfirmController,
                                obscureText: state.isObscure,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText:
                                      'auth.register.confirmPassword'.tr(),
                                  prefixIcon: Padding(
                                    padding: const ProjectPadding
                                        .inputDecorationPadding(),
                                    child: Assets.icons.icPassword.toGetSvg(),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: changeObscure,
                                    icon: Icon(
                                      state.isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context).textTheme.titleSmall,
                                children: [
                                  TextSpan(
                                    text: 'auth.register.userAgreement.prefix'
                                        .tr(),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await SuccessDialog.show(
                                          title:
                                              'auth.register.userAgreement.read'
                                                  .tr(),
                                          context: context,
                                        );
                                      },
                                    text: 'auth.register.userAgreement.accept'
                                        .tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'auth.register.userAgreement.suffix'
                                        .tr(),
                                  ),
                                  TextSpan(
                                    text:
                                        'auth.register.userAgreement.readAndContinue'
                                            .tr(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: 'auth.register.userAgreement.period'
                                        .tr(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const ProjectPadding.verticalLager(),
                            child: SizedBox(
                              width: double.infinity,
                              height: 56.h,
                              child:
                                  BlocBuilder<RegisterViewModel, RegisterState>(
                                builder: (context, state) {
                                  return ProductElevatedButton(
                                    isLoading: state.isLoading,
                                    title: 'auth.register.registerButton',
                                    onPressed: register,
                                  );
                                },
                              ),
                            ),
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

  Row buildRegisterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'auth.register.haveAccount'.tr(),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: () {
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          },
          child: Text(
            'auth.register.loginLink'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14.sp),
          ),
        ),
      ],
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
            padding: ProjectPadding.horizontalSmall(),
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
