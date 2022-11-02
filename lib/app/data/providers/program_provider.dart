import 'package:get/get.dart';

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

  Future<Response<Program>> postProgram(Program program) async =>
      await post('program', program);
  Future<Response> deleteProgram(int id) async => await delete('program/$id');
}
