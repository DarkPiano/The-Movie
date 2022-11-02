import 'package:flutter/material.dart';
import 'package:the_novie_db/ui/widgets/movie/movie_list/movie_list_widget.dart';
import 'package:the_novie_db/ui/widgets/news/news_widget.dart';
import 'package:the_novie_db/ui/widgets/series/series_list/series_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void _onItemTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TMDB'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          NewsWidget(),
          MovieListWidget(),
          SeriesListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Series',
          ),
        ],
        onTap: _onItemTab,
      ),
    );
  }
}
