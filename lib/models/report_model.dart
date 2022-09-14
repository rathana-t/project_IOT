class Reports {
  String date;
  List<Report> reportList;
  Reports({
    required this.date,
    required this.reportList,
  });
}

class Report {
  String title;
  String image;
  Report({
    required this.title,
    required this.image,
  });
}
