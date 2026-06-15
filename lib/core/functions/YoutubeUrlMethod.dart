String youtubeUrlMethod(String url) {
  String videoId = '';

  if (url.contains('youtube.com') || url.contains('youtu.be')) {
    try {
      Uri uri = Uri.parse(url);

      if (uri.host == 'youtu.be') {
        videoId = uri.pathSegments.first;
      } else if (uri.host == 'www.youtube.com' || uri.host == 'youtube.com') {
        if (uri.queryParameters.containsKey('v')) {
          videoId = uri.queryParameters['v']!;
        }
      }
    } catch (e) {
      print('حدث خطأ أثناء استخراج معرف الفيديو من الرابط.');
    }
  } else {
    print('الرابط المدخل ليس رابطًا صالحًا لفيديو YouTube.');
  }

  return videoId;
}


String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
  if (!url.contains("http") && (url.length == 11)) return url;
  if (trimWhitespaces) url = url.trim();

  for (var exp in [
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
  ]) {
    Match? match = exp.firstMatch(url);
    if (match != null && match.groupCount >= 1) return match.group(1);
  }

  return null;
}