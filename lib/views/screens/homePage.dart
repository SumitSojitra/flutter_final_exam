import 'package:final_practical_exam/helper/dbHelper.dart';
import 'package:final_practical_exam/model/moodDbModel.dart';
import 'package:final_practical_exam/utils/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fetchAllCategory() {
    allMoods = DbHelper.dbHelper.fetchAllMoods();
  }

  @override
  void initState() {
    super.initState();
    fetchAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          "Quotes App",
          style: GoogleFonts.robotoSlab(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(bg2), fit: BoxFit.cover),
            ),
          ),
          FutureBuilder(
            future: allMoods,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                List<moodDbModel>? data = snapshot.data;
                if (data!.isEmpty) {
                  return const Center(
                    child: Text("No data available"),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Select Your Mood",
                          style: GoogleFonts.robotoSlab(
                              color: blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownMenu(
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          textStyle: GoogleFonts.roboto(color: blue),
                          initialSelection: dropDownSelect,
                          dropdownMenuEntries: List.generate(
                            data.length + 1,
                            (index) => (index == 0)
                                ? DropdownMenuEntry(
                                    value: "Select", label: "Select")
                                : DropdownMenuEntry(
                                    value: data[(index - 1)].quotesMood,
                                    label: data[(index - 1)].quotesMood,
                                  ),
                          ),
                          onSelected: (val) {
                            setState(() {
                              dropDownSelect = val!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(blue)),
                            onPressed: () {
                              if (dropDownSelect != "Select") {
                                allQuotes = DbHelper.dbHelper
                                    .fetchAllQuotes(mood: dropDownSelect);
                                Get.toNamed("/quotes");
                              }
                            },
                            child: Text(
                              "Enter",
                              style: TextStyle(color: Colors.white),
                            )),

                        // ListView.builder(itemCount: ,itemBuilder: (context, index) => ,),
                      ],
                    ),
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
