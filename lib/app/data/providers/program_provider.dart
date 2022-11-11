import 'package:get/get.dart';
import 'package:mobile_ziswaf/app/data/models/total_selesai_berlangsung_model.dart';

import '../../utils/shared_preferences.dart';
import '../models/program_model.dart';

class ProgramProvider extends GetConnect {
  String url = 'https://ziswaf-server.smarteschool.net';

  Future<List<Program>> getProgram() async {
    final response = await get('$url/relawan-program',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.isOk) {
      var data = response.body['programs'];
      List<Program> program = [];
      data.forEach((e) => {program.add(Program.fromJson(e))});
      return program;
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }

  Future<Meta> getTotalBerlangsung(String? berlangsung) async {
    final response = await get('$url/relawan-program?nav=$berlangsung',
        headers: {'Authorization': 'bearer ${sharedPrefs.token}'});
    if (response.isOk) {
      var data = response.body['meta'];
      return Meta.fromJson(data);
    } else {
      throw 'Server Error! Coba lagi nanti';
    }
  }

  Future<Response<Program>> postProgram(Program program) async =>
      await post('program', program);
  Future<Response> deleteProgram(int id) async => await delete('program/$id');
}
