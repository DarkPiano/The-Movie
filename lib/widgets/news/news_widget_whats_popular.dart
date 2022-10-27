import 'package:flutter/material.dart';
import 'package:the_novie_db/resources/resources.dart';
import 'package:the_novie_db/widgets/elements/radial_precent_widget.dart';

class NewsWhatsPopularWidget extends StatelessWidget {
  const NewsWhatsPopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            'What`s Popular',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 275,
            child: ListView.builder(
              itemCount: 20,
              itemExtent: 190,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Image(image: AssetImage(AppImages.cyberpunk)),
                          // _descriptionWidget(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _descriptionWidget extends StatelessWidget {
  const _descriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: RadialPercentWidget(
                percent: 0.72,
                fillColor: Color.fromARGB(255, 10, 23, 25),
                lineColor: Color.fromARGB(255, 37, 203, 103),
                freeColor: Color.fromARGB(255, 25, 54, 31),
                lineWidth: 3,
                child: Text('72%'),
              ),
            ),
            Text(
              'Cyberpunk: Edgerunners',
              maxLines: 3,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Sep 13, 2022',
              maxLines: 1,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
