import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:planeto/details.dart';
import 'package:planeto/swiper.dart';
import 'package:planeto/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7],
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Planets',
                      style: GoogleFonts.poppins(
                        fontSize: 44.0,
                        fontWeight: FontWeight.w900,
                        color: titleTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 500.0,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          activeSize: 15.0,
                          space: 5.0,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) {
                                  return Details(
                                    planetInfo: planets[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 100.0),
                                  Card(
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 100.0),
                                          Text(
                                            planets[index].name,
                                            style: GoogleFonts.poppins(
                                              fontSize: 40.0,
                                              fontWeight: FontWeight.w900,
                                              color: primaryTextColor,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            'Solar System',
                                            style: GoogleFonts.poppins(
                                              fontSize: 23.0,
                                              fontWeight: FontWeight.w500,
                                              color: secondaryTextColor,
                                            ),
                                          ),
                                          SizedBox(height: 32),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Know More',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: secondaryTextColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 50.0,
                                right: 20,
                                child: Text(
                                  planets[index].position.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 200.0,
                                    fontWeight: FontWeight.w900,
                                    color: primaryTextColor.withOpacity(0.15),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: planets[index].position,
                                child: Image.asset(planets[index].iconImage),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
