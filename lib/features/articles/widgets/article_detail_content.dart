import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/articles/widgets/article_metadata.dart';

class ArticleDetailContent extends StatelessWidget {
  const ArticleDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height * 0.29,
      child: Container(
        decoration: BoxDecoration(
          color: context.appColorsExtensions.backgroundPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: kToolbarHeight + 24,
          ),
          children: [
            Text(
              "See How the Forest is Helping Our World",
              style: context.appTextStyleExtensions.h3,
            ),
            const SizedBox(height: 16),
            const ArticleMetadata(),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                style: context.appTextStyleExtensions.body1,
                children: const [
                  TextSpan(
                    text:
                        "Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. In this article, we will explore the ways in which forests are helping our world.\n\n",
                  ),
                  TextSpan(
                    text:
                        "One of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves. This carbon sequestration helps to mitigate climate change by reducing the amount of greenhouse gases in the atmosphere. Forests are estimated to absorb approximately 2.4 billion tonnes of carbon dioxide each year, which is equivalent to around 10% of global greenhouse gas emissions.\n\n",
                  ),
                  TextSpan(
                    text:
                        "Forests also play a crucial role in maintaining the water cycle. Trees absorb water from the soil and release it back into the atmosphere through a process known as transpiration. This helps to regulate the local climate and prevents soil erosion and flooding. Forests also act as natural water filters, helping to purify water that flows through them.\n\n",
                  ),
                  TextSpan(
                    text:
                        "Forests are also important sources of biodiversity. They provide habitat for countless species of plants and animals, many of which are found nowhere else on earth. Forests also provide a source of food and medicine for many communities around the world. In fact, it is estimated that around 80% of the world's population relies on traditional medicine derived from plants, many of which are found in forests.\n\n",
                  ),
                  TextSpan(
                    text:
                        "In addition to their ecological and cultural importance, forests also provide economic benefits. They provide jobs and income for millions of people around the world, particularly in rural areas. Forests also provide timber, paper, and other products that are essential to many industries.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
