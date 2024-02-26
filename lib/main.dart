import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 240,
                child: Container(
                    child: Image.asset('assets/icons/seesaw_main.png')),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        // 여기에 Center 위젯 추가
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '이메일을 입력하세요.',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 1,
                                color: const Color.fromARGB(255, 177, 177, 177),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        '패스워드 찾기',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(250, 82, 78, 137),
                    ),
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors
                            .white, // Set text color to white or any desired color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
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
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: const BorderSide(
                          color: Color.fromARGB(255, 124, 124, 124),
                          width: 0.3), // Set border color and width
                    ),
                    child: const Text(
                      'Google로 시작하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Set text color to black
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: const BorderSide(
                          color: Color.fromARGB(255, 124, 124, 124),
                          width: 0.3), // Set border color and width
                    ),
                    child: const Text(
                      'Apple로 시작하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Set text color to black
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: const BorderSide(
                          color: Color.fromARGB(255, 124, 124, 124),
                          width: 0.3), // Set border color and width
                    ),
                    child: const Text(
                      '이메일로 시작하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Set text color to black
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 135),
                child: SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
