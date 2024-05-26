import 'dart:io';

import 'package:flutter/material.dart';

showImage(String path) {
  if (!path.contains("http")) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  } else {
    return Image.network(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        if (error is NetworkImageLoadException && error.statusCode == 404) {
          return const Icon(
            Icons.image,
            size: 80,
          );
        } else {
          return const Icon(
            Icons.image_not_supported,
            size: 80,
          );
        }
      },
    );
  }
}
