import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utility/colors.dart';
import 'package:instagram_clone/utility/utils.dart';
import 'package:instagram_clone/widgets/input_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _bioTEcontroller = TextEditingController();
  final TextEditingController _userTEcontroller = TextEditingController();
  Uint8List? _image;

  void selectImage() async{
   Uint8List im =  await pickImage(ImageSource.camera);
   setState(() {
     _image = im;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  _image != null ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                  : const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg")
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              InputTextField(
                  textEditingController: _userTEcontroller,
                  hintText: "Enter username",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              InputTextField(
                textEditingController: _emailTEcontroller,
                hintText: "Enter email",
                textInputType: TextInputType.emailAddress,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InputTextField(
                textEditingController: _passwordTEcontroller,
                hintText: "Enter Password",
                textInputType: TextInputType.emailAddress,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InputTextField(
                textEditingController: _bioTEcontroller,
                hintText: "Enter bio",
                textInputType: TextInputType.emailAddress,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {
                  String  res = await AuthMethods().signUpUser(
                    email: _emailTEcontroller.text,
                    pass: _passwordTEcontroller.text,
                    username: _userTEcontroller.text,
                    bio: _bioTEcontroller.text,
                    file: _image!,
                  );
                  print(res);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  child: const Text("Sign up"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have any account?"),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    _bioTEcontroller.dispose();
    _userTEcontroller.dispose();
  }
}
