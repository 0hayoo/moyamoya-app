import 'dart:isolate';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/school.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/school/school_data_source.dart';
import 'package:moyamoya/utiles/utile.dart';

class SignUpRetrieveSchoolViewModel extends GetxController {
  final schoolDataSource = Get.find<SchoolDataSource>();

  String _nowText = "";
  final RxList<School> schools = RxList.empty();
  final RxList<School> filterSchools = RxList.empty();

  Future<bool> getSchools() async {
    final ReceivePort receivePort = ReceivePort();
    Isolate.spawn(_runIsolate, [
      receivePort.sendPort,
      dotenv.env['BASE_URL']!,
    ]);
    receivePort.listen((message) {
      print(message.runtimeType);
      if (message.runtimeType == List<School>) {
        schools.value = message;
        changeText(_nowText);
      }
    });
    return true;
  }

  void changeText(String text) {
    _nowText = text;
    filterSchools.value = schools
        .where(
          (value) => containsInitialConsonant(
            value.name,
            text,
          ),
        )
        .toList();
  }

  void _runIsolate(List<dynamic> args) async {
    final sendPort = args[0] as SendPort;
    final baseUrl = args[1] as String;

    final response = await schoolDataSource.getSchools(baseUrl);

    switch (response) {
      case Success<List<School>>():
        sendPort.send(response.data);
      case Error<List<School>>():
        response.error.printError();
        sendPort.send(response.error);
      // Get.snackbar("Error", response.error.toString());
    }
  }
}
