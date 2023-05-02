import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../base/data/source/api_constants.dart';

Widget cachedNetworkImage(imageUrl, {height, width, fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: ApiUrls.imageUrl(imageUrl),
    width: width,
    height: height,
    fit: fit,
    placeholder: (context, url) => Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
