import 'package:amazon_clone/common/Widgets/MyTextField.dart';
import 'package:amazon_clone/common/mycustombutton.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum Auth { signIn, signUp }

class MyAuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const MyAuthScreen({super.key});

  @override
  State<MyAuthScreen> createState() => _MyAuthScreenState();
}

class _MyAuthScreenState extends State<MyAuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyGlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10,top: 20,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth==Auth.signUp?MyGlobalVariables.backgroundColor:MyGlobalVariables.greyBackgroundCOlor,
                title: Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: MyGlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: EdgeInsets.all(8),
                  color: MyGlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        MyCustomTextField(
                            controller: _nameController, hintText: "Name"),
                        Gap(10),
                        MyCustomTextField(
                            controller: _emailController, hintText: "Email"),
                        Gap(10),
                        MyCustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        Gap(10),
                        MyCustomButton(onTap: (){}, text: "Sign Up")
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth==Auth.signIn?MyGlobalVariables.backgroundColor:MyGlobalVariables.greyBackgroundCOlor,
                title: Text(
                  'Sign-In',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: MyGlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: EdgeInsets.all(8),
                  color: MyGlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        MyCustomTextField(
                            controller: _emailController, hintText: "Email"),
                        Gap(10),
                        MyCustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        Gap(10),
                        MyCustomButton(onTap: (){}, text: "Sign In")
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
