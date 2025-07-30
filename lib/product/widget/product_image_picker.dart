import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductImagePicker {
  static Future<bool> _handleCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();

    if (status.isPermanentlyDenied) {
      if (context.mounted) {
        final openSettings = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('general.imagePicker.permissions.camera.title'.tr()),
            content:
                Text('general.imagePicker.permissions.camera.message'.tr()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('general.buttons.cancel'.tr()),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('general.buttons.settings'.tr()),
              ),
            ],
          ),
        );

        if (openSettings == true) {
          await openAppSettings();
        }
      }
      return false;
    }

    return status.isGranted;
  }

  static Future<bool> _handleGalleryPermission(BuildContext context) async {
    final status = await Permission.photos.request();

    if (status.isPermanentlyDenied) {
      if (context.mounted) {
        final openSettings = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('general.imagePicker.permissions.gallery.title'.tr()),
            content:
                Text('general.imagePicker.permissions.gallery.message'.tr()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('general.buttons.cancel'.tr()),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('general.buttons.settings'.tr()),
              ),
            ],
          ),
        );

        if (openSettings == true) {
          await openAppSettings();
        }
      }
      return false;
    }

    return status.isGranted;
  }

  static Future<XFile?> show(BuildContext context) async {
    XFile? selectedImage;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle indicator
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Camera option
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: Text(
                'general.imagePicker.camera'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                final hasPermission = await _handleCameraPermission(context);
                if (hasPermission) {
                  final image =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  selectedImage = image;
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),

            // Gallery option
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: Text(
                'general.imagePicker.gallery'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () async {
                final hasPermission = await _handleGalleryPermission(context);
                if (hasPermission) {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  selectedImage = image;
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );

    return selectedImage;
  }
}
