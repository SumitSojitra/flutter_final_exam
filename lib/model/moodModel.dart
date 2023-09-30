import 'package:final_practical_exam/model/quotesModel.dart';

class moodModel {
  int id;
  String quotesMood;
  List<QuotesModel> quotes;

  moodModel({required this.id, required this.quotes, required this.quotesMood});

  factory moodModel.fromMap(Map<String, dynamic> data) {
    return moodModel(
        id: data['moodId'],
        quotes: List<QuotesModel>.from(
          data["quotes"].map(
            (quote) => QuotesModel.fromMap(data: quote),
          ),
        ),
        quotesMood: data['quotesMood']);
  }
}
