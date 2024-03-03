import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final PageController _pageController = PageController(initialPage: 0);
  double _currentPage = 0;
  double _progress = 1 / 4;

  bool _allChecked = false;
  bool _agree1Checked = false;
  bool _agree2Checked = false;
  bool _agree3Checked = false;

  void onPageChanged(int page) {
    setState(() {
      _currentPage = page.toDouble();
      _progress = (_currentPage + 1) / 4;
    });
  }

  void nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void toggleAllChecked(bool value) {
    setState(() {
      _allChecked = value;
      _agree1Checked = value;
      _agree2Checked = value;
      _agree3Checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 22,
            ),
            onPressed: () {
              Get.back(); // GetX에서 이전 화면으로 이동
            },
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            '회원가입',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: const Color(0xFFD9D9D9),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF524E89),
              ),
              minHeight: 5, // 게이지 두께 조정
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: onPageChanged,
                children: [
                  _buildPage1("첫 번째 페이지"),
                  _buildPage2("두 번째 페이지"),
                  _buildPage3("세 번째 페이지"),
                  _buildPage4("네 번째 페이지"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage1(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '시쏘에 오신 것을',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            '환영합니다!',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            '시쏘를 더욱 즐겁게 사용하기 위해',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          ),
          const Text(
            '아래 내용을 확인해주세요.',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: const Color(0xFFD9D9D9),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Checkbox(
                              value: _allChecked,
                              onChanged: (value) {
                                toggleAllChecked(value!);
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(40, 13, 0, 0),
                              child: Text('전체 동의합니다.'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 38, 15, 0),
                      child: Divider(
                        color: Color(0xFFD9D9D9),
                        thickness: 1.0,
                      ),
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 44, 0, 0),
                              child: Stack(
                                children: [
                                  Checkbox(
                                    value: _agree1Checked,
                                    onChanged: (value) {
                                      setState(() {
                                        _agree1Checked = value!;
                                      });
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(40, 13, 0, 0),
                                    child: Text('이용약관에 동의합니다. (필수)'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                              child: Stack(
                                children: [
                                  Checkbox(
                                    value: _agree2Checked,
                                    onChanged: (value) {
                                      setState(() {
                                        _agree2Checked = value!;
                                      });
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(40, 13, 0, 0),
                                    child: Text('개인정보 취급 방침에 동의합니다. (필수)'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 106, 0, 0),
                              child: Stack(
                                children: [
                                  Checkbox(
                                    value: _agree3Checked,
                                    onChanged: (value) {
                                      setState(() {
                                        _agree3Checked = value!;
                                      });
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(40, 13, 0, 0),
                                    child: Text('마케팅 정보 수신에 동의합니다. (선택)'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(250, 82, 78, 137),
              ),
              child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '반가워요!',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            '이메일을 입력해주세요',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 25,
          ),
          const Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Column(
                      children: [
                        Text(
                          '이메일 주소',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '이메일을 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF9D9C9C),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(250, 82, 78, 137),
              ),
              child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage3(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '시쏘와의 첫만남!',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            '이름을 알려주세요',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 25,
          ),
          const Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Column(
                      children: [
                        Text(
                          '이름 (닉네임)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '이름 또는 닉네임을 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF9D9C9C),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 62, 4, 0),
                    child: Column(
                      children: [
                        Text(
                          '이름 (닉네임)은 회원가입 이후 언제든 변경할 수 있어요 :)',
                          style: TextStyle(
                            color: Color(0xFF9D9C9C),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 46,
          ),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(250, 82, 78, 137),
              ),
              child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage4(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '마지막으로',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            '비밀번호를 입력해주세요',
            style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 25,
          ),
          const Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Column(
                      children: [
                        Text(
                          '비밀번호',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF9D9C9C),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 62, 4, 0),
                    child: Column(
                      children: [
                        Text(
                          '문자와 숫자를 포함한 8자리 이상',
                          style: TextStyle(
                            color: Color(0xFF9D9C9C),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Column(
                      children: [
                        Text(
                          '비밀번호 확인',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '위에서 입력한 동일한 비밀번호를 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF9D9C9C),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 46,
          ),
          SizedBox(
            height: 42,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: nextPage,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(250, 82, 78, 137),
              ),
              child: const Text(
                '가입하기',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
