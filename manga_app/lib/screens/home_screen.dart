

import 'package:flutter/material.dart';
import 'package:manga_app/constants/constants.dart';
import 'package:manga_app/widgets/bot_nav_item.dart';
import 'package:web_scraper/web_scraper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;
  bool mangaLoaded = true;
  List<Map<String,dynamic>>? mangaList;

  void navBarTap(int index){
    setState(() {
      selectedNavIndex = index;
    });
  }

  void fetchMang() async {
    final webscraper = WebScraper(Constants.baseUrl);

    if(await webscraper.loadWebPage('/wwww')){
      mangaList = webscraper.getElement('div-container-main-left > div.panel-content-homepage >div > a > img', ['src','alt']);

      setState(() {
        mangaLoaded = true;
      });

      print(mangaList);
      
    }
  }

  @override
  void initState() {
    fetchMang();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Manga'),
        backgroundColor: Constants.darkgray,
      ),
      body:mangaLoaded ? 
      Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Constants.black,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                height: 30,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text('${mangaList?.length} mangas', style:const TextStyle(
                  fontSize: 23,
                  color: Colors.white
                ),),
              )
            ],
          ),
        ),
      )
      :
      const Center(child: CircularProgressIndicator()), 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constants.darkgray,
        selectedItemColor: Constants.lightblue,
        unselectedItemColor: Colors.white,
        currentIndex: selectedNavIndex,
        onTap: navBarTap,
        items: [
          BotNavItem(Icons.explore_outlined, 'EXPLORE'),
          BotNavItem(Icons.favorite, 'FAVORITE'),
          BotNavItem(Icons.watch_later, 'RECENTE'),
          BotNavItem(Icons.more_horiz, 'MORE')
        ],
      ),
    );
  }
}