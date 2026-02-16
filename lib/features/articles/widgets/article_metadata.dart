import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/core/models/author.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/core/utils/picture_utils.dart';
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
            child: Image.network(
              PictureUtils.getFullUrl(url: author?.avatar.url ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "${author?.firstName} ${author?.lastName}${publishedAt != null ? ' · ${DateFormat.yMMMd().format(publishedAt!)}' : ''}",
          style: context.appTextStyleExtensions.footnote.copyWith(
            color: context.appColorsExtensions.textSecondary,
          ),
        ),
      ],
    );
  }
}
