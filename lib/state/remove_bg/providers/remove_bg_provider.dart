import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_apps/state/remove_bg/models/image_model.dart';
import 'package:http/http.dart' as http;
import 'package:photo_apps/state/utilities/api_url.dart';

final removeBgProvider =
    FutureProvider.autoDispose.family<ImageModel, Uint8List>(
  (ref, Uint8List imagedata) async {
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrl.removeBgUrl));
    var imageFile = http.MultipartFile.fromBytes(
      'image', // Field name on the server
      imagedata,
      filename: 'image.jpg', // Optional filename for server-side reference
    );
    request.files.add(imageFile);
    request.headers['Content-Type'] = 'multipart/form-data';
    final response = await request.send();
    if (response.statusCode == 201) {
      String jsonData = await response.stream.bytesToString();
      final data = jsonDecode(jsonData);

      // Handle parsing errors if needed
      if (data is! Map<String, dynamic>) {
        throw Exception('Invalid JSON response');
      }
      return ImageModel.fromJson(data);
    } else {
      print('error occur');
      throw Future.error("Something went Wrong");
    }
  },
);
