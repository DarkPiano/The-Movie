import 'package:flutter/material.dart';
import 'package:the_novie_db/widgets/series/series_details/series_details_main_info_widget.dart';
import 'package:the_novie_db/widgets/series/series_details/series_details_main_screen_cast_widget.dart';

class SeriesDetailsWidget extends StatefulWidget {
  final int seriesId;

  const SeriesDetailsWidget({
    Key? key,
    required this.seriesId,
  }) : super(key: key);

  @override
  State<SeriesDetailsWidget> createState() => _SeriesDetailsWidgetState();
}

class _SeriesDetailsWidgetState extends State<SeriesDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cyberpunk: Edgerunners'),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            SeriesDetailsMainInfoWidget(),
            SizedBox(height: 30),
            SeriesDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}
