import 'package:final_practical_exam/helper/dbHelper.dart';
import 'package:final_practical_exam/model/moodDbModel.dart';
import 'package:final_practical_exam/utils/globals/globals.dart';
import 'package:flutter/material.dart';
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
          title: Text(
            "Quotes App",
            style: GoogleFonts.robotoSlab(),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
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
                      Text(
                        "Select Your Mood",
                        style: GoogleFonts.robotoSlab(),
                      ),
                      DropdownMenu(
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
                    ],
                  ),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
