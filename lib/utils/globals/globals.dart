import 'dart:ui';

import 'package:final_practical_exam/model/moodDbModel.dart';
import 'package:final_practical_exam/model/quotesDbmodel.dart';

bool tableInsert = false;
String dropDownSelect = "Select";
Future<List<moodDbModel>> allMoods = [] as Future<List<moodDbModel>>;

Future<List<QuotesDabModel>> allQuotes = [] as Future<List<QuotesDabModel>>;

Color blue = Color(0xff447105);
String bg1 =
    "https://images.unsplash.com/photo-1487147264018-f937fba0c817?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3wxOTc3MzAyfHxlbnwwfHx8fHw%3D&w=1000&q=80";
String bg2 =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRacF1cQo7ruKRERFl5wYmomVJZsW1Q9JuKm4ULQk43MwEX5mZ-CbMkYAAIa1eF6S6V76M&usqp=CAU";
