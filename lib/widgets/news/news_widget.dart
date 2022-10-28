import 'package:flutter/material.dart';
import 'package:the_novie_db/resources/resources.dart';
import 'package:the_novie_db/widgets/news/news_widget_free_to_watch.dart';
import 'package:the_novie_db/widgets/news/news_widget_trailers.dart';
import 'package:the_novie_db/widgets/news/news_widget_trending.dart';
import 'package:the_novie_db/widgets/news/news_widget_whats_popular.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _TopPosterWidget(),
          NewsWhatsPopularWidget(),
          NewsFreeToWatchWidget(),
          NewsTrailersWidget(),
          NewsTrendingWidget(),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(image: AssetImage(AppImages.newsTopHeader)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome.',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Millions of movies, TV shows and people to discover. '
                    'Explore now.',
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
