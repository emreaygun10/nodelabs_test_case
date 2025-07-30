import 'dart:io';

import 'package:architecture_template/product/service/interface/file_operation.dart';
import 'package:architecture_template/product/service/manager/product_service_path.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

class FileService extends FileOperation {
  FileService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  static const int maxFileSizeBytes = 3 * 1024 * 1024;

  String _getReadableFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    var i = 0;
    double size = bytes.toDouble();
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    return "${size.toStringAsFixed(1)} ${suffixes[i]}";
  }

  void _validateFormDataFileSizes(FormData formData) {
    for (final entry in formData.files) {
      final multipartFile = entry.value;

      if (multipartFile.length == null) {
        throw Exception('Unable to determine file size. Please try again.');
      }

      if (multipartFile.length! > maxFileSizeBytes) {
        final fileSize = multipartFile.length!;
        final readableSize = _getReadableFileSize(fileSize);
        final maxReadableSize = _getReadableFileSize(maxFileSizeBytes);
        final fileName = multipartFile.filename ?? 'Selected image';

        throw Exception(
            'File "$fileName" is too large ($readableSize). Maximum allowed size is $maxReadableSize.');
      }
    }
  }

  @override
  Future<User> uploadPhoto(FormData formData) async {
    try {
      _validateFormDataFileSizes(formData);

      _networkManager.addBaseHeader(
        MapEntry(HttpHeaders.authorizationHeader,
            'Bearer ${ProductStateItems.productCache.userCacheOperation.getAll().first.user.token}'),
      );

      final response = await _networkManager.uploadFile<dynamic>(
        ProductServicePath.uploadProfilePhoto.value,
        formData,
      );

      if (response.data == null) {
        throw Exception('Server returned empty response. Please try again.');
      }

      final responseData = response.data as Map<String, dynamic>;

      if (!responseData.containsKey('data')) {
        throw Exception('Invalid server response format. Please try again.');
      }

      final authResponse =
          User.fromJson(responseData["data"] as Map<String, dynamic>);
      return authResponse;
    } catch (e) {
      final errorString = e.toString().toLowerCase();

      if (errorString.contains('413') ||
          errorString.contains('payload too large')) {
        final maxReadableSize = _getReadableFileSize(maxFileSizeBytes);
        throw Exception(
            'Image file is too large. Maximum allowed size is $maxReadableSize.');
      }

      if (errorString.contains('timeout')) {
        throw Exception(
            'Upload timeout. Please check your internet connection and try again.');
      }
      rethrow;
    }
  }
}
