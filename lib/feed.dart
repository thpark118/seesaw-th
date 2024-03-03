import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _selectedButtonIndex = 1; // 처음 페이지에 진입했을 때 전체 버튼이 선택된 상태

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updateButtonColor(1);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    minimumSize: const Size(57, 32),
                    backgroundColor:
                        _selectedButtonIndex == 1 ? Colors.black : Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: _selectedButtonIndex == 1
                            ? Colors.black
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  child: Text(
                    '전체',
                    style: TextStyle(
                      color: _selectedButtonIndex == 1
                          ? Colors.white
                          : Colors.black,
                      fontWeight: _selectedButtonIndex == 1
                          ? FontWeight.normal
                          : FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    _updateButtonColor(2);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    minimumSize: const Size(57, 32),
                    backgroundColor:
                        _selectedButtonIndex == 2 ? Colors.black : Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: _selectedButtonIndex == 2
                            ? Colors.black
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  child: Text(
                    '구독',
                    style: TextStyle(
                      color: _selectedButtonIndex == 2
                          ? Colors.white
                          : Colors.black,
                      fontWeight: _selectedButtonIndex == 2
                          ? FontWeight.normal
                          : FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    _updateButtonColor(3);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    minimumSize: const Size(70, 32),
                    backgroundColor:
                        _selectedButtonIndex == 3 ? Colors.black : Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: _selectedButtonIndex == 3
                            ? Colors.black
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  child: Text(
                    '팔로잉',
                    style: TextStyle(
                      color: _selectedButtonIndex == 3
                          ? Colors.white
                          : Colors.black,
                      fontWeight: _selectedButtonIndex == 3
                          ? FontWeight.normal
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.3,
            color: const Color(0xFFD9D9D9),
          ),
          Expanded(
            child: _buildSelectedPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedPage() {
    switch (_selectedButtonIndex) {
      case 1:
        return AllPage();
      case 2:
        return SubscriptionPage();
      case 3:
        return FollowingPage();
      default:
        return Container();
    }
  }

  void _updateButtonColor(int buttonIndex) {
    setState(() {
      _selectedButtonIndex = buttonIndex;
    });
  }
}

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
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
                            '김시소0',
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

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
                            '김시소1',
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

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
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
                            '김시소2',
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

void main() {
  runApp(const MaterialApp(
    home: Feed(),
  ));
}
