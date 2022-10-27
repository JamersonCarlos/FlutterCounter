import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpg'),
            fit: BoxFit.fill
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado!':'Pode Entrar!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: isFull ? Colors.red:Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w700,
                  color: isFull ? Colors.red: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null:decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Color(0xFFE800F5).withOpacity(0.2): Color(0xFFE800F5),
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Color(0xFFE800F5).withOpacity(0.2): Color(0xFFE800F5),
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,

                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
