import 'dart:convert';
import 'dart:developer';
import '../../../../core/constant/app-const.dart';
import 'package:http/http.dart' as http;
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/network/remote/error_model.dart';
import '../../domain/models/rating-member-model.dart';
import '../../domain/models/team-info_model.dart';
import '../../domain/models/team-list-model.dart';
import '../../domain/models/team-member-info_model.dart';
import '../../domain/models/team-member-list-model.dart';
import '../../domain/models/team-member-model.dart';

class TeamsRepo {
  Future insertTeam({required String name, required String type, required String description }) async {
    try {
      print("insert team repo");

      print("try");
      var headers =  {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };

      final body = {
        "name":name,
        "description": description,
        "type": type,};

      http.Response response = await http.post(
        Uri.parse(insertTeamUrl),
        headers: headers,
        body: jsonEncode(body), // use jsonEncode()
      );

      print("status code: ${response.statusCode}");
      print("status code: ${response.body.toString()}");
      if (response.statusCode == 201) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        // log(response.body);
        log("false");
        return response.body;
      }
    } catch (e) {
      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future addCommonQuestion({required String question, required String answer, required int id }) async {
    try {
      print("insert addCommonQuestion repo");

      print("try");
      var headers =  {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };

      final body = {
        "answer":answer,
        "question": question,};

      http.Response response = await http.post(
        Uri.parse("$addCommonQuestionUrl/$id"),
        headers: headers,
        body: jsonEncode(body), // use jsonEncode()
      );

      print("status code: ${response.statusCode}");
      print("status code: ${response.body.toString()}");
      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        // log(response.body);
        log("false");
        return response.body;
      }
    } catch (e) {
      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future getTeamsList() async {
    print("show teams request list repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse(showTeams),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamListModel.fromJson(json);

        return TeamListModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return errorModelFromJson(response.body.toString());
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future getTeamCommonQuestion(int id) async {
    print("getTeamCommonQuestion repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse("$getCommonQuestionUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamListModel.fromJson(json);

        return TeamListModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return errorModelFromJson(response.body.toString());
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future joinTeamRequest(int id) async {
    print("join teams request repo");

    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$joinTeamRequestUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        print("تم إرسال طلب الانضمام للفريق $id");
        // log(response.body.toString());
        // Map<String, dynamic> json = jsonDecode(response.body);
        // var x = TeamListModel.fromJson(json);
        //
        // return TeamListModel.fromJson(json);

        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future showTeamInfo(int id) async {
    print("showTeamInfo repo");

    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$showTeamInfoUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamInfoModel.fromJson(json);

        return TeamInfoModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return errorModelFromJson(response.body.toString());
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future showTeamJoinRequest(int id) async {
    print("showTeamJoinRequestUrl repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$showTeamJoinRequestUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true we get join request to team number $id");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamMembersListModel.fromJson(json);

        return TeamMembersListModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future showTeamMemberInfo(int id) async {
    print("showTeamMemberInfo repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$showTeamMemberInfoUrl/member/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true we get join request to team number $id");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamMemberInfoModel.fromJson(json);

        return TeamMemberInfoModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future acceptJoinRequest(int id) async {
    print("acceptJoinReques repo");

    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$acceptJoinRequestUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future refuseJoinRequest(int id) async {
    print("refuseJoinRequest repo");
    try {
      log("try");
      http.Response response = await http.delete(
          Uri.parse("$refuseJoinRequestUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future memberDeleteFromTeam({required int teamId, required int memberId}) async {
    print("refuseJoinRequest repo");
    try {
      log("try");
      http.Response response = await http.delete(
          Uri.parse("$memberDeleteFromTeamUrl/member/$memberId/team/$teamId"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future memberAddToTeamUrl({required int teamId, required int memberId}) async {
    print("refuseJoinRequest repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$memberAddToTeamUrl/$memberId/$teamId"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future specifyTeamLeader({required int teamId, required int memberId}) async {
    print("specifyTeamLeader repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$specifyTeamLeaderUrl/member/$memberId/team/$teamId"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log(response.body);
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future specifyTeamSupervisor({required int teamId, required int memberId}) async {
    print("refuseJoinRequest repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$specifyTeamSupervisorUrl/member/$memberId/team/$teamId"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future showAdmin() async {
    print("show admin repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse(showAdminUrl),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamListModel.fromJson(json);

        return TeamListModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return errorModelFromJson(response.body.toString());
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future showTeamMember(int id) async {
    print("show team membert repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse("$showTeamMemberUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        Map<String, dynamic> json = jsonDecode(response.body);
        var x = TeamMemberListModel.fromJson(json);

        return TeamMemberListModel.fromJson(json);
      } else {
        log(response.toString());
        log("false");
        return errorModelFromJson(response.body.toString());
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }

  Future retreatFromTeam(int id) async {
    print("retreatFromTeamUrl repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$retreatFromTeamUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return true;
      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future addRating({required int teamId, required int memberId, required int rate, required String date}) async {
    print("addRating repo");
    try {
      log("try");
      var headers =  {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };

      final body = {
        "rating_value":rate,
        "rating_date": date,};

      http.Response response = await http.post(
        Uri.parse("$addRatingUrl/team/$teamId/member/$memberId"),
        headers: headers,
        body: jsonEncode(body), // use jsonEncode()
      );
      print("state code: ${response.statusCode}");
      log(response.body.toString());

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
        return "true";
      } else {
        log(response.toString());
        log("false");
        log(response.body);
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }
  Future showRating(int id) async{
    print("show rate repo");
    try {
      log("try");
      http.Response response = await http.post(
          Uri.parse("$showRatingUrl/$id"),
          headers: {
            'Authorization': 'Bearer ${AppConst.token}',
            'Content-Type': 'application/json',
            'Accept': '*/*',
          }
      );
      print("state code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log("true");
        log(response.body.toString());
      Map<String, dynamic> json = jsonDecode(response.body);
      var x = RatingMemberModel.fromJson(json);

      return RatingMemberModel.fromJson(json);



      } else {
        log(response.toString());
        log("false");
        return response.body;
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }

}