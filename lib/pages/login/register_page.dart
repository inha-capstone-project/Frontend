import 'package:flutter/material.dart';
import '../../common/flutter_toast.dart';
import '../../common/text_field.dart';
import '../../common/text_style.dart';
import '../../json_data/auth_services.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  // register method
  void _register() {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // make sure passwords match
    if (passwordController.text != confirmPwController.text) {
      // pop loading circle
      Navigator.of(context).pop();
      //show error message to user
      flutterToast('패스워드가 일치하지 않습니다.', '#dc1c13', '#dc1c13');
    } else {
      createUser(usernameController.text, passwordController.text, nickNameController.text, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('회원가입 페이지', style: appBarTS()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 300, child: TextFieldWidget(text: '아이디를 입력해주세요', obscureText: false, controller: usernameController)),
                SizedBox(width: 10),
                const SizedBox(height: 20),
                SizedBox(width: 300, child: TextFieldWidget(text: '닉네임을 입력하세요', obscureText: false, controller: nickNameController)),
                const SizedBox(height: 20),
                SizedBox(width: 300, child: TextFieldWidget(text: '패스워드를 입력하세요', obscureText: true, controller: passwordController)),
                const SizedBox(height: 20),
                SizedBox(width: 300, child: TextFieldWidget(text: '패스워드를 다시 입력하세요', obscureText: true, controller: confirmPwController)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 15),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                      onPressed: _register,
                      child: Text('회원가입'),
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
}
