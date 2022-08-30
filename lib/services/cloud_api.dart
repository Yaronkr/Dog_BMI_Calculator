import 'dart:typed_data';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:gcloud/storage.dart';
import 'package:mime/mime.dart';

class CloudApi {
  final auth.ServiceAccountCredentials _credentials;
  auth.AutoRefreshingAuthClient? _client = null; // to make the call to the google platform

  CloudApi(String json) : _credentials = auth.ServiceAccountCredentials.fromJson(json);

  Future<ObjectInfo> save(String name, Uint8List imgBytes) async {
    if (_client == null) _client = await auth.clientViaServiceAccount(_credentials, Storage.SCOPES);
    var storage = Storage(_client!, 'Image Upload Google Storage');
    var bucket = storage.bucket('mydogpicture');
    final type = lookupMimeType(name);
    final timeStamp = DateTime.now().millisecondsSinceEpoch;

    return await bucket.writeBytes(name, imgBytes,
        metadata: ObjectMetadata(
          contentType: type,
          custom: {
            'timestamp': '$timeStamp', // custom metadeta
          },
        ));
  }
}
