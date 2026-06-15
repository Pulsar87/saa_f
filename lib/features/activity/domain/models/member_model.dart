// import 'dart:convert';
//
// MemberModel memberModelFromJson(String str) =>
//     MemberModel.fromJson(json.decode(str));
//
// class MemberModel {
//   MemberModel({
//     this.sucesss,
//     this.msg,
//     this.data,
//   });
//
//   MemberModel.fromJson(dynamic json) {
//     sucesss = json['sucesss'];
//     msg = json['msg'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   bool? sucesss;
//   String? msg;
//   Data? data;
// }
//
// Data dataFromJson(String str) => Data.fromJson(json.decode(str));
//
// class Data {
//   Data({
//     this.currentPage,
//     this.members,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.links,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//   int? currentPage;
//   List<MemberInfo>? members;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   dynamic nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;
//   Data.fromJson(dynamic json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       members = [];
//       json['data'].forEach((v) {
//         members?.add(MemberInfo.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = [];
//       json['links'].forEach((v) {
//         links?.add(Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
// }
//
// Links linksFromJson(String str) => Links.fromJson(json.decode(str));
//
// class Links {
//   Links({
//     this.url,
//     this.label,
//     this.active,
//   });
//
//   Links.fromJson(dynamic json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//   dynamic url;
//   String? label;
//   bool? active;
// }
//
// MemberInfo memberInfoFromJson(String str) =>
//     MemberInfo.fromJson(json.decode(str));
//
// class MemberInfo {
//   MemberInfo({
//     this.id,
//     this.arabicName,
//     this.englishName,
//     this.city,
//     this.phoneNumber,
//     this.email,
//     this.name,
//   });
//   int? id;
//   String? arabicName;
//   String? englishName;
//   String? city;
//   String? phoneNumber;
//   String? email;
//   String? name;
//
//   MemberInfo.fromJson(dynamic json) {
//     id = json['id'];
//     arabicName = json['arabic_name'];
//     englishName = json['english_name'];
//     city = json['City'];
//     phoneNumber = json['phone_number'];
//     email = json['email'];
//     name = json['name'];
//   }
// }
