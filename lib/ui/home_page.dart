import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, welcome',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Recent Files',
                    style: TextStyle(
                      color: Color(0xFF737C96),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                  Spacer(),
                  Icon(Icons.menu, color: Color.fromARGB(255, 32, 136, 221), size: 25),
                  SizedBox(width: 13),
                  Icon(Icons.qr_code),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Folders",
                style: TextStyle(
                  color: Color(0xFF737C96),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 168,
                    height: 66,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.05,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: const Color(0xFFE06D06),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.file_copy_rounded,
                                    color: Color.fromARGB(255, 244, 130, 98),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Management',
                                        style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'April 19, 2020',
                                        style: TextStyle(
                                          color: Color(0xFFBBC3C8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 168,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.05,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: const Color.fromARGB(255, 53, 6, 224),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.file_copy_rounded,
                                    color: Color.fromARGB(255, 72, 122, 248),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Having fun',
                                        style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'April 19, 2020',
                                        style: TextStyle(
                                          color: Color(0xFFBBC3C8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(100),
                child: Center(
                  child: Image.asset("assets/images/zzz.png"),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(width: 30),
                  SizedBox(width: 30),
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/scanner");
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
