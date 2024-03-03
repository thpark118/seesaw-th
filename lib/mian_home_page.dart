import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:seesaw_th/feed.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  late PageController _pageController;

  final List<String> imageList = [
    'assets/images/sp.jpg',
    'assets/images/sp.jpg',
    'assets/images/sp.jpg',
    'assets/images/sp.jpg',
    'assets/images/sp.jpg',
  ];

  late TabController _tabController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(
      viewportFraction: 1.0,
      keepPage: true,
      initialPage: 1000, // A large initial page to allow for looping
    );

    // Start the timer to auto-scroll every 10 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });

    // Listen to page changes and update _currentPage
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round() % imageList.length;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the timer and page controller
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          children: [
            Image(
              height: 18,
              image: AssetImage('assets/icons/seesaw_name.png'),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
              size: 32,
              color: Color.fromARGB(212, 24, 24, 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.menu,
                size: 32,
                color: Color.fromARGB(212, 24, 24, 24),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              AspectRatio(
                aspectRatio: 60 / 30,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {},
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: Image.asset(
                        imageList[index % imageList.length],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: imageList.asMap().entries.map((entry) {
                          return Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == entry.key
                                  ? const Color(0xFF524E89)
                                  : const Color(0xFFFFFFFF),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0, // add this line if needed
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TabBar(
                          controller: _tabController,
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: const Color(0xFF9D9C9C),
                          indicatorPadding:
                              const EdgeInsets.only(top: 4, bottom: 1),
                          indicator: const BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          dividerHeight: 0.3,
                          dividerColor: const Color(0xFFD9D9D9),
                          tabs: const <Widget>[
                            Tab(text: '추천'),
                            Tab(text: '피드'),
                            Tab(
                              child: Row(
                                children: [
                                  Spacer(
                                    flex: 4,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Icon(
                                        Icons.lock_open_outlined,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  Text('모음'),
                                  Spacer(
                                    flex: 8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '인기순',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(Icons.expand_more,
                                      size: 27, color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        Recommand(), // 첫 번째 탭에 대한 위젯
                        Feed(), // 두 번째 탭에 대한 위젯
                        Gather(), // 세 번째 탭에 대한 위젯
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Recommand extends StatefulWidget {
  const Recommand({Key? key}) : super(key: key);

  @override
  State<Recommand> createState() => _RecommandState();
}

class _RecommandState extends State<Recommand> {
  final List<String> imageList1 = [
    'assets/images/sample.png',
    'assets/images/sample.png',
    'assets/images/sample.png',
    'assets/images/sample.png',
    'assets/images/sample.png',
    'assets/images/sample.png',
    'assets/images/sample.png',
    'assets/images/sample.png',
  ];

  final List<String> Namelist = [
    '김시소',
    '김시소',
    '김시소',
    '김시소',
    '김시소',
    '김시소',
    '김시소',
    '김시소',
  ];
  final List<String> titlelist = [
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
    '크리에이터 [시소] 입니다!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            expandedHeight: 70,
            title: Text(
              '지금 가장 핫한! 크리에이터',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 19.0,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(imageList1[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Namelist[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromARGB(211, 20, 20, 20),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    titlelist[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(211, 20, 20, 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Gather extends StatefulWidget {
  const Gather({Key? key}) : super(key: key);

  @override
  State<Gather> createState() => _GatherState();
}

class _GatherState extends State<Gather> {
  int _currentPage = 0;

  final PageController _pageController = PageController(
    viewportFraction: 1.0,
    keepPage: true,
  );

  final List<String> imageList = [
    'assets/images/sp2.png',
    'assets/images/sp2.png',
    'assets/images/sp2.png',
    'assets/images/sp2.png',
    'assets/images/sp2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // 아이템 개수 조정
        itemBuilder: (BuildContext context, int index) {
          // 여기서 각 아이템을 반환합니다.
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/sample.png',
                        ),
                        radius: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '김시소',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '14분 전',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFACACAC),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xFFACACAC),
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud\n'),
              AspectRatio(
                aspectRatio: 60 / 25,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: imageList.map((imagePath) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: imageList.asMap().entries.map((entry) {
                          return Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == entry.key
                                  ? const Color(0xFF524E89)
                                  : const Color(0xFFD9D9D9),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xFFACACAC),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '좋아요',
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '8',
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Color(0xFFACACAC),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '댓글',
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '8',
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.turned_in_not,
                    color: Color(0xFFACACAC),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFF3F3F3),
          thickness: 11.0,
        ),
      ],
    );
  }
}
