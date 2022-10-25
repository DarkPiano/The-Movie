import 'package:flutter/material.dart';
import '../../resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String subtitle;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.subtitle,
  });
}

class MovieListWidget extends StatelessWidget {
  final _movies = [
    Movie(
      imageName: AppImages.fall,
      title: 'Fall',
      time: 'August 10, 2022',
      subtitle: 'For best friends Becky (Grace Caroline Currey) and Hunter (Virginia Gardner), life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights in this adrenaline-fueled thriller co-starring Jeffrey Dean Morgan.',
    ),
  ];

  MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _movies.length,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        final movie = _movies[index];
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    Image(image: AssetImage(movie.imageName)),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            movie.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                  onTap: () {
                    print('1');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
