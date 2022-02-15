import 'package:firebasetask/common/widgets/button_widget.dart';
import 'package:firebasetask/common/widgets/snack_bar.dart';
import 'package:firebasetask/common/widgets/textfield_widget.dart';
import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:firebasetask/core/utils/colors.dart';
import 'package:firebasetask/core/utils/screen_loader.dart';
import 'package:firebasetask/core/utils/sizes.dart';
import 'package:firebasetask/core/utils/validators.dart';
import 'package:firebasetask/di.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/presentation/cubit/login/login_cubit.dart';
import 'package:firebasetask/presentation/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FormValidators _validators = FormValidators.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  LoginCubit cubit = sl();

  @override
  void initState() {
    super.initState();
    // emailController.text = "masood@gmail.com";
    // passwordController.text = "123456";
  }
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldGlobalKey,
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bobtail",
                  style: StyleText.boldDarkGrey28,
                ),
                50.verticalSpace,
                _buildFields(context),
                60.verticalSpace,
                _buildLoginButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            fillColor: UIColors.white,
            hintText: "Email address",
            hintStyle: StyleText.hintStyle,
            labelTextStyle: StyleText.regularDarkGray18,
            textStyle: StyleText.regularDarkGrey14,
            controller: emailController,
            validator: _validators.validateEmail,
            textInputAction: TextInputAction.next,
            eBorderRadius: BorderRadius.circular(5),
            fBorderRadius: BorderRadius.circular(5),
          ),
          25.verticalSpace,
          TextFormFieldWidget(
            fillColor: UIColors.white,
            hintText: "Password",
            hintStyle: StyleText.hintStyle,
            obscureText: true,
            labelTextStyle: StyleText.regularDarkGray18,
            textStyle: StyleText.regularDarkGrey14,
            controller: passwordController,
            validator: _validators.validatePassword,
            textInputAction: TextInputAction.done,
            eBorderRadius: BorderRadius.circular(5),
            fBorderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else if (state is UserFailure) {
          snackBarError(msg: state.error, scaffoldState: _scaffoldGlobalKey);
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return state is UserLoading
              ? const AppCircularIndicator()
              : SizedBox(
                  width: 150.flexibleWidth,
                  height: 50.flexibleHeight,
                  child: ButtonWidget(
                    btnText: 'LOG IN',
                    elevation: 5,
                    btnColor: UIColors.primaryColor,
                    textStyle: StyleText.boldWhite18,
                    borderRadius: BorderRadius.circular(5.0),
                    btnClick: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.submitSignIn(
                            user: UserEntity(
                                email: emailController.text,
                                password: passwordController.text));
                      }
                    },
                  ),
                );
        },
      ),
    );
  }

  loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(UIColors.primaryColor),
      ),
    );
  }
}
