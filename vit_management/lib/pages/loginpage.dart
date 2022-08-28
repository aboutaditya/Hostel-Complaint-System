import 'package:flutter/material.dart';
import 'package:vit_management/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          child: Center(
            child: Column(
              children: [
                const SafeArea(child: SizedBox(height: 10,),),
                Image.asset("images/vitlogo.png"),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(),
                  validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Registration Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    hintText: "Enter Registration Number", labelText: "Registration No. :"),
                ),SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(),
                  validator: ((value) {
                  if (value!.isEmpty) {
                    return "password";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    hintText: "Enter Password", labelText: "Password:"),
                ),
                SizedBox(height: 10,),
                SizedBox(height: 10,),

                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Home()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.blue;
                      return Colors.blue; 
                    },
                  ),
                ),
                child: Text("LOGIN"),
              ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
