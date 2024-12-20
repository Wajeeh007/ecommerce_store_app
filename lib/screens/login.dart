import 'package:ecommerce_store/bloc_and_cubit/login/login_event.dart';
import 'package:ecommerce_store/utils/common_functions.dart';
import 'package:ecommerce_store/utils/constants.dart';
import 'package:ecommerce_store/utils/custom_widgets/custom_buttons.dart';
import 'package:ecommerce_store/utils/custom_widgets/custom_textfield.dart';
import 'package:ecommerce_store/utils/extensions/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_and_cubit/login/login_bloc.dart';
import '../bloc_and_cubit/login/login_state.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/login_bg.jpg',
              ),
              fit: BoxFit.fill
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
                color: Colors.black54
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeadingTexts(),
                  const EmailPasswordFields(),
                  CustomNormalButton(onBtnPress: () {
                    if(formKey.currentState!.validate()) {
                      //TODO: Add login functionality
                    }
                  }, btnText: 'Login',),
                  const ForgotPasswordBtn(),
                  const OrSignInText(),
                  const SocialMediaLoginBtns(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Don\'t have an account?',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: primaryCreamWhite
                      )
                  ),
                  CustomTextButton(
                      btnText: 'Sign Up.',
                      onBtnPress: () {

                      }
                  ),
                ],
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listenWhen: (previous, current) => previous.loadingState != current.loadingState,
                listener: (context, state) {
                  if(state.loadingState == LoadingState.failed) {
                    CommonFunctions.showSnackBar(
                        isError: true,
                        context: context,
                        title: 'Error',
                        message: state.apiResponseMsg
                    );
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}

/// Welcome and Login texts
class HeadingTexts extends StatelessWidget {
  const HeadingTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Log in',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: secondaryDarkBrown
          ),
        ),
        Text(
          'Hi Welcome!!!',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: primaryCreamWhite
          ),
        ),
        const SizedBox(height: 20,),

      ],
    );
  }
}

/// Email and Password textform fields
class EmailPasswordFields extends StatelessWidget {

  const EmailPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return AuthTextFormField(
                title: 'Email',
                hintText: 'Enter Email',
              validator: (value) {
                  if(value == null || value == '') {
                    return 'Field cannot be empty';
                  } else {
                    if(value.isValidEmail()) {
                      return null;
                    } else {
                      return 'Enter valid email address';
                    }
                  }
              },
              onChanged: (value) => context.read<LoginBloc>().add(EmailInputEvent(value: value)),
                );
              }),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return AuthTextFormField(
                  title: 'Password',
                  hintText: 'Enter Password',
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Field cannot be empty';
                      } else {
                        return null;
                      }
                    },
                  obscureText: state.obscurePassword,
                  suffixIcon: IconButton(
                      onPressed: () => context.read<LoginBloc>().add(ShowPasswordEvent()),
                      icon: Icon(
                        state.obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 18,
                      )
                  ),
                  onChanged: (value) => context.read<LoginBloc>().add(PasswordInputEvent(value: value)),
                );
                },
            )
          ],
        ),
      ),
    );
  }
}

/// Forgot Password button widget
class ForgotPasswordBtn extends StatelessWidget {
  const ForgotPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: CustomTextButton(
            btnText: 'Forgot Password?',
            onBtnPress: () {}
        )
    );
  }
}

/// Or Sign In text and dividers
class OrSignInText extends StatelessWidget {
  const OrSignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.
        symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 10,
        children: [
          const Expanded(
            child: Divider(
              height: 1.2,
              color: primaryCreamWhite,
            ),
          ),
          Text(
            'Or Sign In with',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: secondaryCreamWhite
            ),
          ),
          const Expanded(
            child: Divider(
              height: 1.2,
              color: primaryCreamWhite,
            ),
          )
        ],
      ),
    );
  }
}

/// Social Media Login buttons row widget
class SocialMediaLoginBtns extends StatelessWidget {
  const SocialMediaLoginBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        SocialMediaBtn(
          platformImageName: 'google_logo.png',
          onBtnPress: () {},
        ),
        SocialMediaBtn(
          platformImageName: 'apple_logo.png',
          onBtnPress: () {},
        )
      ],
    );
  }
}

/// Button for social media login
class SocialMediaBtn extends StatelessWidget {
  const SocialMediaBtn({
    super.key,
    required this.platformImageName,
    required this.onBtnPress,
  });

  final String platformImageName;
  final VoidCallback onBtnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: primaryWhite,
      ),
      child: InkWell(
        onTap: onBtnPress,
          child: Image.asset(
              'assets/images/$platformImageName'
          )
      ),
    );
  }
}