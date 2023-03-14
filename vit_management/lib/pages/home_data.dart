import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ComplaintPage.dart';

class HomeData extends StatelessWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 17),
            itemCount: demo_data.length,
            itemBuilder: (BuildContext, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Electrician(
                              image: demo_data[index].image,
                              name: demo_data[index].name)));
                },
                child: FittedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        demo_data[index].image,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        demo_data[index].name,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}

class homeOption {
  final String name, image;
  homeOption(
    this.image,
    this.name,
  );
}

final List<homeOption> demo_data = [
  homeOption(
    "images/electrician.png",
    "Electrician",
  ),
  homeOption("images/carpenter.png", 'Carpenter'),
  homeOption("images/plumber.png", 'Plumber'),
  homeOption("images/cleaner.png", 'Cleaner'),
  homeOption("images/others.png", 'Others')
];
