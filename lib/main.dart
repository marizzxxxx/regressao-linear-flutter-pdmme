import 'package:flutter/material.dart';

void main() {
  runApp(const RegressaoLinearApp());
}

class RegressaoLinearApp extends StatelessWidget {
  const RegressaoLinearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regressão Linear',
      home: const RegressaoLinearPage(),
    );
  }
}

class RegressaoLinearPage extends StatefulWidget {
  const RegressaoLinearPage({super.key});

  @override
  State<RegressaoLinearPage> createState() => _RegressaoLinearPageState();
}

class _RegressaoLinearPageState extends State<RegressaoLinearPage> {
  final TextEditingController _controller = TextEditingController();
  String resultado = 'XXXX';

  void calcular() {
    double x = double.tryParse(_controller.text) ?? 0;

    // Exemplo simples de regressão linear
    double a = 2;
    double b = 3;

    double y = a * x + b;

    setState(() {
      resultado = y.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regressão Linear'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Insira um valor:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              'O valor analisado pelo modelo é $resultado',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
