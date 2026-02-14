import 'package:flutter/material.dart';

class ArticleDetailImage extends StatelessWidget {
  const ArticleDetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.59,
      child: Image.network(
        "https://images.pexels.com/photos/18887675/pexels-photo-18887675.jpeg",
        fit: BoxFit.cover,
      ),
    );
  }
}
