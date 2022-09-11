import 'package:flutter/material.dart';
import 'package:vit_management/pages/plumber.dart';

import 'carpenter.dart';
import 'cleaner.dart';
import 'electrician.dart';
import 'other.dart';

class HomeData extends StatelessWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Electrician()),
                            );
                          },
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return 0;
                                }
                                return 0;
                              },
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white;
                                }
                                return Colors.white;
                              },
                            ),
                          ),
                          child: Image.asset(
                            "images/electrician.jpg",
                            height: 170,
                          ),
                        ),
                        const Text(
                          "Electrician",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.3),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const carpenter()),
                            );
                          },
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return 0;
                                }
                                return 0;
                              },
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.white;
                                return Colors.white;
                              },
                            ),
                          ),
                          child: Image.asset(
                            "images/carpenter.jpg",
                            height: 170,
                          ),
                        ),
                        const Text("Carpenter",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15.3))
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const cleaner()),
                            );
                          },
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return 0;
                                }
                                return 0;
                              },
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.white;
                                return Colors.white;
                              },
                            ),
                          ),
                          child: Image.asset(
                            "images/cleaner.jpg",
                            height: 170,
                          ),
                        ),
                        const Text("Cleaner",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15.3))
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const plumber()),
                            );
                          },
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return 0;
                                }
                                return 0;
                              },
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.white;
                                return Colors.white;
                              },
                            ),
                          ),
                          child: Image.asset(
                            "images/plumber.jpg",
                            height: 170,
                          ),
                        ),
                        const Text("Plumber",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15.3))
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const other()),
                            );
                          },
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return 0;
                                }
                                return 0;
                              },
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.white;
                                return Colors.white;
                              },
                            ),
                          ),
                          child: Image.asset(
                            "images/others.jpg",
                            height: 170,
                          ),
                        ),
                        const Text("Others",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15.3))
                      ],
                    ),
                  ),
                ],
              );
  }
}