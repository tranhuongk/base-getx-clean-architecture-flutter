import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../themes/c_colors.dart';

///
/// Example:
/// ```
/// CImage(url: "https://...");
/// ```
/// or
/// ```
/// CImage(asset: Assets.images....);
/// ```
/// Choose this one !!!
///
class CImage extends StatelessWidget {
  const CImage({
    Key? key,
    this.onTap,
    this.asset,
    this.url,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
    this.border,
    this.boxShadow,
    this.color,
    this.backgroundColor,
    this.fit = BoxFit.contain,
  })  : assert(
            (asset != null && asset is AssetGenImage || asset is SvgGenImage) ||
                url != null),
        assert(!(asset != null && url != null)),
        super(key: key);

  final VoidCallback? onTap;

  final dynamic asset;
  final String? url;

  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  final BoxBorder? border;
  final BoxShadow? boxShadow;

  final Color? color;
  final Color? backgroundColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    Widget _image = const SizedBox();
    Widget _noImage = Assets.images.imNoImage.image();
    if (url != null) {
      _image = CachedNetworkImage(
        imageUrl: url!,
        color: color,
        fit: fit,
        placeholder: (_, __) {
          if (Platform.isAndroid) {
            return const Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(CColors.mainColor),
                ),
              ),
            );
          }
          return CupertinoActivityIndicator(
            radius: width == null ? 10 : (width! / 3 > 10 ? 10 : width! / 3),
          );
        },
        errorWidget: (_, __, ___) => _noImage,
      );
    } else if (asset is AssetGenImage) {
      _image = (asset as AssetGenImage).image(
        color: color,
        fit: fit,
        errorBuilder: (_, __, ___) => _noImage,
      );
    } else if (asset is SvgGenImage) {
      _image = (asset as SvgGenImage).svg(
        color: color,
        fit: fit,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border,
          color: backgroundColor,
          boxShadow: boxShadow != null ? [boxShadow!] : null,
        ),
        height: height,
        width: width,
        child: ClipRRect(
          child: _image,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
