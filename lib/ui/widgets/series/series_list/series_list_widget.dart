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
      imageName: AppImages.cyberpunk,
      title: 'Cyberpunk: Edgerunners',
      time: 'September 13, 2022',
      subtitle: 'A Street Kid trying to survive in a technology and body '
               'modification-obsessed city of the future. Having everything '
               'to lose, he chooses to stay alive by becoming an Edgerunner, '
               'a Mercenary outlaw also known as a Cyberpunk.',
    ),
    Series(
      id: 2,
      imageName: AppImages.firstKill,
      title: 'First Kill',
      time: 'June 10, 2022',
      subtitle: 'Falling in love is tricky for teens Juliette and Calliope: '
          'One`s a vampire, the other`s a vampire hunter and both are ready '
          'to make their first kill.',
    ),
    Series(
      id: 3,
      imageName: AppImages.theSandman,
      title: 'The Sandman',
      time: 'August 5, 2022',
      subtitle: 'Upon escaping after decades of imprisonment by a mortal '
          'wizard, Dream, the personification of dreams, sets about to reclaim '
          'his lost equipment.',
    ),
    Series(
      id: 4,
      imageName: AppImages.houseOfTheDragon,
      title: 'House of the Dragon',
      time: 'August 21,2022',
      subtitle: 'An internal succession war within House Targaryen at the '
          'height of its power, 172 years before the birth of Daenerys '
          'Targaryen.',
    ),
    Series(
      id: 5,
      imageName: AppImages.bienvenidosAEden,
      title: 'Bienvenidos a Edén',
      time: 'May 6, 2022',
      subtitle: 'A group of young adults attend a party on a remote island, '
          'but the tempting paradise they find waiting for them holds dangerous '
          'secrets and entrapments.',
    ),
    Series(
      id: 6,
      imageName: AppImages.theLordOfTheRings,
      title: 'The Lord of the Rings: The Rings of Power',
      time: 'September 1, 2022',
      subtitle: 'Epic drama set thousands of years before the events of J.R.R. '
          'Tolkien`s `The Hobbit` and `The Lord of the Rings` follows an '
          'ensemble cast of characters, both familiar and new, as they '
          'confront the long-feared re-emergence of evil to Middle-earth.',
    ),
    Series(
      id: 7,
      imageName: AppImages.dahmer,
      title: 'Dahmer - Monster: The Jeffrey Dahmer Story',
      time: 'September 21, 2022',
      subtitle: 'Story of the Milwaukee Monster told from the perspective of '
          'the victims and police incompetence that allowed the Wisconsin '
          'native to go on a multiyear killing spree.',
    ),
    Series(
      id: 8,
      imageName: AppImages.echoes,
      title: 'Echoes',
      time: 'August 21, 2022',
      subtitle: 'Leni and Gina are identical twins who have secretly swapped '
          'their lives since they were children, culminating in a double life '
          'as adults, but one of the sisters goes missing and everything in '
          'their perfectly schemed world turns into chaos.',
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
