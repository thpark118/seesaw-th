import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seesaw_th/finding_password_page.dart';
import 'package:seesaw_th/join_page.dart';
import 'package:seesaw_th/mian_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'seesaw',
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'seesaw'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 240,
                  child: Image.asset('assets/icons/seesaw_main.png'),
                ),
                const SizedBox(
                  height: 55,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Stack(
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 0, 0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
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
                                          fontWeight: FontWeight.bold),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 0, 0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const FindingPass());
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '비밀번호 찾기',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const MainHome());
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF524E89),
                            /*shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 원하는 radius 값으로 조정
                            ),*/
                          ),
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 42,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color(0xFFD9D9D9),
                                thickness: 1.0,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              ' 또는 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Divider(
                                color: Color(0xFFD9D9D9),
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                            /*shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 원하는 radius 값으로 조정
                            ),*/
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 22,
                                height: 22,
                                child:
                                    Image.asset('assets/icons/google_icon.png'),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text(
                                'Google로 시작하기',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                            /*shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 원하는 radius 값으로 조정
                            ),*/
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  SizedBox(
                                    width: 33,
                                    height: 33,
                                    child: Image.asset(
                                        'assets/icons/apple_icon.png'),
                                  ),
                                ],
                              ),
                              const Text(
                                'Apple로 시작하기  ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const JoinPage());
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFFD9D9D9),
                              width: 1.0,
                            ),
                            /*shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // 원하는 radius 값으로 조정
                            ),*/
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.email,
                                size: 19,
                                color: Color(0xFF000000),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '이메일로 시작하기',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          elevation: 0,
                          side: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 1.0,
                          ),
                          minimumSize: const Size(100, 35),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Korean',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFD9D9D9),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.expand_more,
                              color: Color(0xFFD9D9D9),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
                      /* TextField(
                        decoration: InputDecoration(
                          hintText: '비밀번호를 입력하세요.',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9D9C9C),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 14.0), // 수정 가능
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        obscureText: true, // 이 부분이 텍스트를 가리는 역할을 합니다.
                      ),*/
                      /* TextField(
                        decoration: InputDecoration(
                          hintText: '이메일을 입력하세요.',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9D9C9C),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 14.0), // 수정 가능
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),*/
                      /*Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 42,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color.fromARGB(
                                    250, 82, 78, 137), // border color
                                width: 1.5, // thickness of the border
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    0), // 원하는 radius 값으로 조정
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Korean',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(
                                  Icons
                                      .expand_more, // You can replace this with your desired icon

                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),*/
                /*SizedBox(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: const BorderSide(
                            color: Color.fromARGB(255, 124, 124, 124),
                            width: 0.3,
                          ), // Set border color and width
                        ),
                        child: const SizedBox(
                          width: 1000,
                          child: Row(
                            children: [
                              Text(
                                '한국어',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11.5,
                                  color: Color.fromARGB(174, 165, 165, 165),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons
                                    .expand_more, // You can replace this with your desired icon
                                color: Color.fromARGB(173, 189, 189, 189),
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),    
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '이메일을 입력하세요', // Hint text

                    // isCollapsed: true,
                    // border: OutlineInputBorder(),
                    // isDense: true,
                    labelText: '이메일 주소', // Label text
                    labelStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ), // Set label text size and color
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black.withOpacity(0.2),
                    ), // Set hint text color
                    contentPadding:
                        const EdgeInsets.fromLTRB(0, 2, 0, 3), // 상하 여백 조절
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always, // Show the label from the beginning
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Set underline color
                        width: 0.2, // Set underline thickness
                      ),
                    ),
                  ),
                  // minLines: 1,
                  // maxLines: 5,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요', // Hint text
                    labelText: '비밀번호', // Label text
                    labelStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ), // Set label text size and color
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black.withOpacity(0.2),
                    ), // Set hint text color
                    contentPadding:
                        const EdgeInsets.fromLTRB(0, 2, 0, 3), // 상하 여백 조절
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always, // Show the label from the beginning
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Set underline color
                        width: 0.2, // Set underline thickness
                      ),
                    ),
                  ),
                  // minLines: 1,
                  // maxLines: 5,
                ),
              ),
              const SizedBox(
                height: 5,
              ),*/
              /*const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: SizedBox(
                    width: double.infinity, // 좌우 최대 길이로 설정
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(175, 223, 223, 223),
                            thickness: 2.0, // 실선의 두께 조절
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '또는',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(175, 223, 223, 223),
                          ),
                        ), // 맨 왼쪽에 텍스트 추가
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(175, 223, 223, 223),
                            thickness: 2.0, // 실선의 두께 조절
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),*/