class moodDbModel {
  int moodId;
  String quotesMood;

  moodDbModel({
    required this.moodId,
    required this.quotesMood,
  });

  factory moodDbModel.formMap({required Map data}) {
    return moodDbModel(
      moodId: data['moodId'],
      quotesMood: data['quotesMood'],
    );
  }
}
