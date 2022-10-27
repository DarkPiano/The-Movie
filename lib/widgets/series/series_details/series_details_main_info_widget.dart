import 'package:flutter/material.dart';
import 'package:the_novie_db/resources/resources.dart';

class SeriesDetailsMainInfoWidget extends StatelessWidget {
  const SeriesDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopPosterWidget(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(AppImages.cyberpunkTopHeader)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.cyberpunk)),
        ),
      ],
    );
  }
}
