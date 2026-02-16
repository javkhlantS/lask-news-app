import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class ArticleMetadata extends StatelessWidget {
  const ArticleMetadata({
    super.key,
    this.publishedAt,
  });

  final DateTime? publishedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            "https://images.pexels.com/photos/262391/pexels-photo-262391.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "Harry Harper${publishedAt != null ? ' · ${DateFormat.yMMMd().format(publishedAt!)}' : ''}",
          style: context.appTextStyleExtensions.footnote.copyWith(
            color: context.appColorsExtensions.textSecondary,
          ),
        ),
      ],
    );
  }
}
