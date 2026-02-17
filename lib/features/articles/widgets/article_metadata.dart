import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/core/models/author.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ArticleMetadata extends StatelessWidget {
  const ArticleMetadata({
    super.key,
    this.publishedAt,
    this.author,
  });

  final DateTime? publishedAt;
  final Author? author;

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
          child: Skeleton.replace(
            replacement: const Bone(),
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/avatar-placeholder.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text.rich(
            TextSpan(
              style: context.appTextStyleExtensions.footnote.copyWith(
                color: context.appColorsExtensions.textSecondary,
              ),
              children: [
                TextSpan(text: "${author?.firstName} ${author?.lastName}"),
                if (publishedAt != null)
                  TextSpan(
                    text:
                        " ·\u00A0${DateFormat.yMMMd().format(publishedAt!).replaceAll(' ', '\u00A0')}",
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
