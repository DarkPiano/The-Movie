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
      subtitle: 'For best friends Becky (Grace Caroline Currey) and Hunter '
          '(Virginia Gardner), life is all about conquering fears and pushing '
          'limits. But after they climb 2,000 feet to the top of a remote, '
          'abandoned radio tower, they find themselves stranded with no way '
          'down. Now Becky and Hunter’s expert climbing skills will be put to '
          'the ultimate test as they desperately fight to survive the elements,'
          ' a lack of supplies, and vertigo-inducing heights in this '
          'adrenaline-fueled thriller co-starring Jeffrey Dean Morgan.',
    ),
    Movie(
        imageName: AppImages.fullmetalAlchemistKanketsuhenFukushushaScarP1,
        title: 'Fullmetal Alchemist: Final Chapter - The Last Transmutation',
        time: 'June 24, 2022',
        subtitle: 'The Elric brothers long and winding journey comes to a '
            'close in this epic finale, where they must face off against an '
            'unworldly, nationwide threat.',
    ),
    Movie(
      imageName: AppImages.blackAdam,
      title: 'Black Adam',
      time: 'October 19, 2022',
      subtitle: 'Nearly 5,000 years after he was bestowed with the almighty '
          'powers of the Egyptian gods-and imprisoned just as quickly-Black '
          'Adam is freed from his earthly tomb, ready to unleash his unique '
          'form of justice on the modern world.',
    ),
    Movie(
      imageName: AppImages.thePeripheral,
      title: 'The Peripheral',
      time: 'October 21, 2022',
      subtitle: 'Set in the future when technology has subtly altered society,'
          ' a woman discovers a secret connection to an alternate reality as '
          'well as a dark future of her own.',
    ),
    Movie(
      imageName: AppImages.theBatman,
      title: 'The Batman',
      time: 'March 1, 2022',
      subtitle: 'When a sadistic serial killer begins murdering key political '
          'figures in Gotham, Batman is forced to investigate the citys hidden '
          'corruption and question his familys involvement.',
    ),
    Movie(
      imageName: AppImages.doctorStrangeInTheMultiverseOfMadness,
      title: 'Doctor Strange in the Multiverse of Madness',
      time: 'May 2, 2022',
      subtitle: 'Doctor Strange teams up with a mysterious teenage girl from '
          'his dreams who can travel across multiverses, to battle multiple '
          'threats, including other-universe versions of himself, which '
          'threaten to wipe out millions across the multiverse. They seek '
          'help from Wanda the Scarlet Witch, Wong and others.',
    ),
    Movie(
        imageName: AppImages.avatarTheWayOfWater,
        title: 'Avatar: The Way of Water',
        time: 'December 14, 2022',
        subtitle: 'Jake Sully lives with his newfound family formed on the '
            'planet of Pandora. Once a familiar threat returns to finish what '
            'was previously started, Jake must work with Neytiri and the army '
            'of the Navi race to protect their planet.',
    ),
    Movie(
        imageName: AppImages.blackPantherWakandaForever,
        title: 'Black Panther: Wakanda Forever',
        time: 'November 14, 2022',
        subtitle: 'The nation of Wakanda is pitted against intervening world '
            'powers as they mourn the loss of their king TChalla.',
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
