import 'package:flutter/material.dart';

class GalleryItemTitle extends StatelessWidget {
  const GalleryItemTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 45,
      width: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.white,
            fontWeight:
            FontWeight.bold),
      ),
    );
  }
}
