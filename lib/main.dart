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
  double _valor = 4.0;
  double _resultado = 0.0;

  void _calcular() {
    setState(() {
      // Exemplo simples de regressão linear
      _resultado = 2.1 * _valor + 0.57;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FA),
      appBar: AppBar(
        title: const Text('Regressão Linear'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Escolha um valor para a regressão linear',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Text(
              'Input value: ${_valor.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
            ),

            Slider(
              value: _valor,
              min: 0,
              max: 10,
              divisions: 100,
              label: _valor.toStringAsFixed(2),
              onChanged: (value) {
                setState(() {
                  _valor = value;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Estimar valor'),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Resultado da Regressão: ${_resultado.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
