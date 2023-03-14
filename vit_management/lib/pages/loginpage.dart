import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vit_management/pages/google_Sign_in.dart';
import 'package:vit_management/pages/signup.dart';
import 'package:vit_management/pages/workerlogin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Text(
                  "Hostel Complaint Management",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Image.network(
                    "https://kineticsoftware.com/wp-content/uploads/2019/07/student-accommodation-1.png",
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  Text(
                    'Welcome Back,',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Login to continue',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 31,
                  ),
                  GestureDetector(
                    onTap: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signup()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://companieslogo.com/img/orig/GOOG-0ed88f7c.png?t=1633218227',
                                height: 31,
                                width: 31,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign In with Google',
                                style: GoogleFonts.poppins(
                                    fontSize: 31, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WorkerLogin()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go to Admin Login',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 22,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
