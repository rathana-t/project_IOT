import 'package:project_iot/models/report_model.dart';

List<Report> reports = [
  Report(
      title: "Front View Camera",
      image:
          'https://images.squarespace-cdn.com/content/v1/51cdafc4e4b09eb676a64e68/1618602532707-3OAII3QVHYKCW3KJ1HJU/cars_boast.jpg'),
  Report(
      title: "Rare View Camera",
      image:
          'https://www.bankrate.com/2021/02/03160602/texas-driving-without-insurance-featured.jpg'),
];

List<Reports> reportList = [
  Reports(date: '09 Sep 2022', reportList: reports),
  Reports(date: '08 Sep 2022', reportList: reports),
];
