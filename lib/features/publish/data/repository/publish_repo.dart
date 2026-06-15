import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:saa_f/features/auth/domain/bloc/auth_bloc.dart';
import 'dart:convert';
import 'dart:io';
import '../../../../core/constant/app-const.dart';
import '../../../../core/network/remote/end_points.dart';
import '../../../../core/network/remote/error_model.dart';
import '../../domain/models/article_info_model.dart';
import '../../domain/models/article_list_model.dart';
import '../../domain/models/image_info_model.dart';
import '../../domain/models/image_list_model.dart';
import '../../domain/models/video_info_model.dart';
import '../../domain/models/video_list_model.dart';


class PublishRepo {

  Future<bool> insertImage({required File image ,required String title ,required String photographerName , required String description, required String mediaCategory}) async {
    try {
      print("insert image repo");
      print(description);
      print(mediaCategory);
      print(photographerName);

      var request = http.MultipartRequest('POST', Uri.parse(insertImageUrl));

      request.headers['Authorization'] = 'Bearer ${AppConst.token}';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = '*/*';

      var multipartFile = await http.MultipartFile.fromPath(
        'img_url',
        image.path,
        filename: 'image.png',
      );

      request.files.add(multipartFile);

      var fields = {
        'title' : title,
        'description': description,
        'Media_Category': mediaCategory,
        'photographer_name': photographerName,
      };

      request.fields.addAll(fields);

      var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 201) {
        print('Image uploaded successfully');
        return true;
      } else {
        print('...Error uploading image');
        log (response.toString());
        return false;
      }
    } catch (e) {
      print('Error uploading image');
      print('Exception: $e');
      return false;
    }
  }

  Future insertVideo({required String videoUrl, required String mediaCategory, required String description , required String title}) async {
    try {
      print("insert video repo");

      print("try");
      var headers =  {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };

      final body = {
        "video_url":videoUrl,
        "description": description,
        "Media_Category": mediaCategory,
        "title": title};

      http.Response response = await http.post(
        Uri.parse(insertVideoUrl),
        headers: headers,
        body: jsonEncode(body), // use jsonEncode()
      );

      print("status code: ${response.statusCode}");
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

  Future showImageRequestList() async {
    print("show image request list repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse(imagesIndexUrl),
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
        var x = ImageListModel.fromJson(json);
        print(x.success );

        return ImageListModel.fromJson(json);
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

  Future showVideoRequestList() async {
    print("show video request list repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse(videoRequestIndexUrl),
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
        var x = VideoListModel.fromJson(json);
        print(x.success );

        return VideoListModel.fromJson(json);
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

  Future getImageInfo(int id) async {
    print("get image info repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse("$imageShowUrl/$id"),
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
        var x = ImageInfoModel.fromJson(json);
        print(x.success );

        return ImageInfoModel.fromJson(json);
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

  Future acceptImage({required int id, required String category, required String description }) async {
    print("accept image repo");

    print(id);
    print(category);
    print(description);

    try {
      print("try");
      final url = Uri.parse("$imageAcceptUrl/$id");
      final headers = {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      final body = jsonEncode({
        "Media_Category": category,
        "description": description,
      });

      final response = await http.post(url, headers: headers, body: body);

      print("status code: ${response.statusCode}");

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

  Future refuseImage({required int id }) async {
    print("refuse image repo");

    print(id);
    try {
      print("try");
      final response = await http.delete(
        Uri.parse("$imageRefuseUrl/$id"),
        headers:  {
          'Authorization': 'Bearer ${AppConst.token}',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },);

      print("status code: ${response.statusCode}");
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

  Future getVideoInfo(int id) async {
    print("get video info repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse("$videoShowUrl/$id"),
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
        var x = VideoInfoModel.fromJson(json);
        print(x.success );

        return VideoInfoModel.fromJson(json);
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

  Future acceptVideo({required int id, required String category, required String description }) async {
    print("accept video repo");

    print(id);
    print(category);
    print(description);

    try {
      print("try");
      final url = Uri.parse("$videoAcceptUrl/$id");
      final headers = {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      final body = jsonEncode({
        "Media_Category": category,
        "description": description,
      });

      final response = await http.post(url, headers: headers, body: body);

      print("status code: ${response.statusCode}");

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

  Future refuseVideo({required int id }) async {
    print("refuse video repo");

    print(id);
    try {
      print("try");
      final response = await http.delete(
        Uri.parse("$videoRefuseUrl/$id"),
        headers:  {
          'Authorization': 'Bearer ${AppConst.token}',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },);

      print("status code: ${response.statusCode}");
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

  Future showImageList({required String categoryName, required int limit, required int skip }) async {
    print("show image list repo");

    try {
      log("try");

      http.Response response = await http.get(
          Uri.parse("$imageShowListUrl?Media_Category=$categoryName&limit=$limit&skip=$skip"),
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
        var x = ImageListModel.fromJson(json);
        print(x.success );

        return ImageListModel.fromJson(json);
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

  Future showVideoList({required String categoryName, required int limit, required int skip }) async {
    print("show video list repo");
    try {
      log("try");

      http.Response response = await http.get(
          Uri.parse("$videoShowListUrl?Media_Category=$categoryName&limit=$limit&skip=$skip"),
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
        var x = VideoListModel.fromJson(json);
        print(x.success );

        return VideoListModel.fromJson(json);
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

  Future getPostList({required String categoryName, required int limit, required int skip }) async {
    print("show post list repo");

    try {
      log("try");

      http.Response response = await http.get(
          Uri.parse("$postShowListUrl?Media_Category=$categoryName&limit=$limit&skip=$skip"),
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
        var x = ImageListModel.fromJson(json);

        print(x.success );

        return ImageListModel.fromJson(json);
      } else {
        log(response.body.toString());
        log("false");
        return errorModelFromJson(response.body.toString());
      }
    } catch (e) {

      log("catch");
      log(e.toString());
      ErrorModel(message: "error", success: "false");
    }
  }

  Future imageLike({required int id }) async {
    print("image like repo");

    print(id);
    try {
      print("try");
      final response = await http.get(
        Uri.parse("$imageLikeUrl/$id"),
        headers:  {
          'Authorization': 'Bearer ${AppConst.token}',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },);

      print("status code: ${response.statusCode}");
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

  Future videoLike({required int id }) async {
    print("video like repo");

    print(id);
    try {
      print("try");
      final response = await http.get(
        Uri.parse("$videoLikeUrl/$id"),
        headers:  {
          'Authorization': 'Bearer ${AppConst.token}',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },);

      print("status code: ${response.statusCode}");
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


  ///article

  Future insertArticleNormal({required File image, required String article, required String mediaCategory, required String title, required String articleWriter,}) async {
    print("insert Article repo");
      try {
        print("insert Article repo");
        print(image.toString());
        print(title);
        print(mediaCategory);

        var request = http.MultipartRequest('POST', Uri.parse(insertArticleUrl));

        request.headers['Authorization'] = 'Bearer ${AppConst.token}';
        request.headers['Content-Type'] = 'application/json';
        request.headers['Accept'] = '*/*';

        var multipartFile = await http.MultipartFile.fromPath(
          'article_img_url',
          image.path,
          filename: 'image.png',
        );

        request.files.add(multipartFile);

        var fields = {
          'title' : title,
          'article category': mediaCategory,
          'text content': article,
          'writer name': articleWriter,
        };

        request.fields.addAll(fields);

        var response = await request.send();

        print(response.statusCode);
        if (response.statusCode == 201) {
          print('Article uploaded successfully');
          return true;
        } else {
          print('...Error uploading article');
          log (response.toString());
          return false;
        }
      } catch (e) {
        print('Error uploading article');
        print('Exception: $e');
        return false;
      }

  }
  Future insertArticleHtml({required File image, required String article,required String articleWriter, required String mediaCategory, required String title,}) async {

    print("insert Article Html repo");
    print("insert Article repo");
    try {
      print("insert image repo");
      print(image.toString());
      print(title);
      print(mediaCategory);
      print("articleWriter $articleWriter" );
      print("article $article" );

      var request = http.MultipartRequest('POST', Uri.parse(insertArticleUrl));

      request.headers['Authorization'] = 'Bearer ${AppConst.token}';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = '*/*';

      var multipartFile = await http.MultipartFile.fromPath(
        'article_img_url',
        image.path,
        filename: 'image.png',
      );

      request.files.add(multipartFile);

      var fields = {
        'title' : title,
        'article category': mediaCategory,
        'html article': article,
        'writer name': articleWriter,
      };

      request.fields.addAll(fields);

      var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 201) {
        print('Article uploaded successfully');
        return true;
      } else {
        print('...Error uploading article');
        log (response.toString());
        return false;
      }
    } catch (e) {
      print('Error uploading article');
      print('Exception: $e');
      return false;
    }


  }

  Future showArticleRequestList() async {
    print("show article request list repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse(articleIndexUrl),
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
        var x = ArticleListModel.fromJson(json);
        print(x.success );

        return ArticleListModel.fromJson(json);
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


  Future getArticleInfo(int id) async {
    print("get article info repo");

    try {
      log("try");
      http.Response response = await http.get(
          Uri.parse("$articleShowUrl/$id"),
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
        var x = ArticleInfoModel.fromJson(json);
        print(x.success );

        return ArticleInfoModel.fromJson(json);
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


  Future acceptArticle({required int id, required String category }) async {
    print("accept article repo");

    print(id);
    print(category);

    try {
      print("try");
      final url = Uri.parse("$articleAcceptUrl/$id");
      final headers = {
        'Authorization': 'Bearer ${AppConst.token}',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      final body = jsonEncode({
        "article_category": category,
      });

      final response = await http.post(url, headers: headers, body: body);

      print("status code: ${response.statusCode}");

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

  Future refuseArticle({required int id }) async {
    print("refuse Article repo");

    print(id);
    try {
      print("try");
      final response = await http.delete(
        Uri.parse("$articleRefuseUrl/$id"),
        headers:  {
          'Authorization': 'Bearer ${AppConst.token}',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },);

      print("status code: ${response.statusCode}");
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

  Future articleLike({required int id }) async {
    print("article like repo");

    print(id);
    print(id);
    print(id);
    try {
      print("try");
      final response = await http.post(
        Uri.parse("$articleLikeUrl/$id"),
        headers:  {
          'Authorization': 'Bearer ${AppConst.token}',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },);

      print("status code: ${response.statusCode}");
      print("state code: ${response.statusCode}");
      log(response.body.toString());
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


}