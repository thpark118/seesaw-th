import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindingPass extends StatefulWidget {
  const FindingPass({Key? key}) : super(key: key);

  @override
  State<FindingPass> createState() => _FindingPassState();
}

class _FindingPassState extends State<FindingPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            '비밀번호 찾기',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                '임시 비밀번호를',
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.normal),
              ),
              const Row(
                children: [
                  Text(
                    '가입하신 이메일',
                    style:
                        TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '로 발송합니다.',
                    style: TextStyle(
                        fontSize: 27.0, fontWeight: FontWeight.normal),
                  ),
                ],
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
                  onPressed: () {
                    Get.to(() => const Pass());
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromARGB(250, 82, 78, 137),
                  ),
                  child: const Text(
                    '비밀번호 재설정',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Pass extends StatefulWidget {
  const Pass({Key? key}) : super(key: key);

  @override
  State<Pass> createState() => _PassState();
}

class _PassState extends State<Pass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            '비밀번호 찾기',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                '아래 이메일로',
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.normal),
              ),
              const Row(
                children: [
                  Text(
                    '임시 비밀번호',
                    style:
                        TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '를 발송했습니다.',
                    style: TextStyle(
                        fontSize: 27.0, fontWeight: FontWeight.normal),
                  ),
                ],
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
                    padding: EdgeInsets.fromLTRB(4, 30, 0, 0),
                    child: Text(
                      'seesaw@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromARGB(250, 82, 78, 137),
                  ),
                  child: const Text(
                    '로그인으로 돌아가기',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
