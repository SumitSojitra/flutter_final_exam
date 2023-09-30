import 'dart:async';
import 'dart:math';

import 'package:final_practical_exam/helper/dbHelper.dart';
import 'package:final_practical_exam/utils/globals/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/quotesDbmodel.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer(
            width: 290,
            backgroundColor: Color(0xffe1b85d),
            child: FutureBuilder(
              future: allQuotes,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<QuotesDabModel>? data = snapshot.data;

                  if (data!.isEmpty) {
                    return Center(
                      child: Text("No data Avilable."),
                    );
                  } else {
                    return Center(
                        child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Container(
                        height: 220,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Color(0xff447105)),
                          image: DecorationImage(
                              image: NetworkImage(bg1), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data[index].quote,
                                style: GoogleFonts.croissantOne(
                                    fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                "— ${data[index].quoteAuthor}",
                                style: GoogleFonts.croissantOne(
                                    fontSize: 16, color: blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
        appBar: AppBar(
          backgroundColor: Color(0xff447105),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ))
          ],
          title: Text(
            "${dropDownSelect}",
            style: GoogleFonts.robotoSlab(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(bg2), fit: BoxFit.cover),
              ),
            ),
            FutureBuilder(
              future: allQuotes,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<QuotesDabModel>? data = snapshot.data;

                  Random r = Random();
                  int randomIndex = r.nextInt(data!.length);

                  Timer(
                    Duration(seconds: 10),
                    () {
                      setState(() {
                        randomIndex = r.nextInt(data!.length);
                      });
                    },
                  );

                  if (data.isEmpty) {
                    return Center(
                      child: Text("No data Avilable."),
                    );
                  } else {
                    return Center(
                      child: Container(
                        height: 220,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Color(0xff447105)),
                          image: DecorationImage(
                              image: NetworkImage(bg1), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data[randomIndex].quote,
                                style: GoogleFonts.croissantOne(
                                    fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                "— ${data[randomIndex].quoteAuthor}",
                                style: GoogleFonts.croissantOne(
                                    fontSize: 16, color: blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ));
  }
}
