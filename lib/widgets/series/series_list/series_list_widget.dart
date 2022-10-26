import 'package:flutter/material.dart';
import 'package:the_novie_db/resources/resources.dart';

class Series {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String subtitle;

  Series({required this.id, required this.imageName, required this.title, required this.time, required this.subtitle,});
}

class SeriesListWidget extends StatefulWidget {
  const SeriesListWidget({Key? key}) : super(key: key);

  @override
  State<SeriesListWidget> createState() => _SeriesListWidgetState();
}

class _SeriesListWidgetState extends State<SeriesListWidget> {
  final _series = [
    Series(
      id: 1,
      imageName: AppImages.fall,
      title: 'Cyberpunk: Edgerunners',
      time: '2022',
      subtitle: 'A Street Kid trying to survive in a technology and body '
               'modification-obsessed city of the future. Having everything '
               'to lose, he chooses to stay alive by becoming an Edgerunner, '
               'a Mercenary outlaw also known as a Cyberpunk.',
    ),
  ];

  var _filterSeries = <Series>[];

  final _searchController = TextEditingController();

  void _searchSeries() {
    final query = _searchController.text;
    if(query.isNotEmpty) {
      _filterSeries = _series.where((Series series) {
        return series.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filterSeries = _series;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchSeries();
    _searchController.addListener(_searchSeries);
  }

  void _onSeriesTab(int index) {
    final id = _series[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/series_details_widget',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70.0),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          itemCount: _filterSeries.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index){
            final movie = _filterSeries[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Flexible(
                          child: Image(
                            image: AssetImage(movie.imageName),
                            fit: BoxFit.cover,
                            width: 110,
                          ),
                        ),
                        // Image(image: AssetImage(movie.imageName),fit: BoxFit.cover,),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onSeriesTab(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}
