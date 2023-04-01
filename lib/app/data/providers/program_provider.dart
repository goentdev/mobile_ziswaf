import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/total_selesai_berlangsung_model.dart';

import '../../utils/shared_preferences.dart';
import '../models/program_model.dart';

class ProgramProvider extends GetConnect {
  String url = 'https://server.yayasanyamini.com';
  Dio dio = Dio();

  Future<List<Program>> getProgram() async {
    final response = await dio.get('$url/relawan-program',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
    if (response.statusCode == 200) {
      var data = response.data['programs'];
      List<Program> program = [];
      data.forEach((e) => {program.add(Program.fromJson(e))});
      return program;
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }

  Future<Meta> getTotalBerlangsung(String? berlangsung) async {
    final response = await dio.get('$url/relawan-program?nav=$berlangsung',
        options:
            Options(headers: {'Authorization': 'bearer ${sharedPrefs.token}'}));
    if (response.statusCode == 200) {
      var data = response.data['meta'];
      return Meta.fromJson(data);
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }
}
