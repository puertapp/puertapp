import 'package:flutter/material.dart';
import '../data/door_data.dart';

class PercentageCalculatorScreen extends StatefulWidget {
  const PercentageCalculatorScreen({super.key});

  @override
  State<PercentageCalculatorScreen> createState() =>
      _PercentageCalculatorScreenState();
}

class _PercentageCalculatorScreenState
    extends State<PercentageCalculatorScreen> {
  final _codeController = TextEditingController();
  final _peopleController = TextEditingController(text: '368');
  bool _isPortainerSelected = false;

  List<int> get _activeList =>
      _isPortainerSelected ? DoorData.portainerList : DoorData.polivalenteList;

  void _calculateTargetCode() {
    final list = _activeList;
    
    if (_codeController.text.isEmpty) {
      showResult('Introduce el código inicial');
      return;
    }

    int? startCode = int.tryParse(_codeController.text);
    if (startCode == null) {
      showResult('Código inicial inválido');
      return;
    }

    int startIndex = list.indexOf(startCode);
    if (startIndex == -1) {
      showResult('El código no existe en la lista');
      return;
    }

    int totalListSize = list.length;
    int peopleToMove = 0;
    String details = "";

    if (_peopleController.text.isNotEmpty) {
      int? people = int.tryParse(_peopleController.text);
      if (people == null) {
        showResult('Número de personas inválido');
        return;
      }
      peopleToMove = people;
      details = "$people personas";
    } else {
      showResult('Rellene el número de personas');
      return;
    }

    int targetIndex = (startIndex - peopleToMove) % totalListSize;
    if (targetIndex < 0) {
      targetIndex += totalListSize;
    }

    int targetCode = list[targetIndex];

    showResult('Mover $details\nCódigo destino: $targetCode');
  }

  void showResult(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      duration: const Duration(seconds: 5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  TextField(
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(labelText: 'Código inicial'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _peopleController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(labelText: 'Número de personas'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Polivalente", style: TextStyle(color: Colors.white)),
                      Switch(
                        value: _isPortainerSelected,
                        onChanged: (value) {
                          setState(() {
                            _isPortainerSelected = value;
                          });
                        },
                      ),
                      const Text("Portainer", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: _calculateTargetCode,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: const Size(200, 50),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Calcular Cambio'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
