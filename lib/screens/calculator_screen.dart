import 'package:flutter/material.dart';
import '../data/door_data.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _codeController = TextEditingController();
  final _doorController = TextEditingController();

  bool _isPortainerSelected = false;

  List<int> get _activeList => _isPortainerSelected ? DoorData.portainerList : DoorData.polivalenteList;

  int get _personasPorFila => _isPortainerSelected ? 3 : 20;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: TextField(
                      controller: _codeController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        label: Text("Código", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextField(
                      controller: _doorController,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) => showResult(),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        label: Text("Puerta", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: TextButton(
                  onPressed: showResult,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(150, 50),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Calcular", textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showResult() {
    String resultado;
    final list = _activeList;

    if (_codeController.text.isNotEmpty && _doorController.text.isNotEmpty) {
      int? code = int.tryParse(_codeController.text);
      int? door = int.tryParse(_doorController.text);

      if (code == null || door == null) {
        resultado = "Códigos inválidos";
      } else {
        var puertaIndex = list.indexOf(door);
        var codigoIndex = list.indexOf(code);

        if (list.contains(code) && list.contains(door)) {
          int diferencia = codigoIndex - puertaIndex;
          if (diferencia < 0) {
            int restantes = list.length - (puertaIndex - codigoIndex);
            resultado =
            "Quedan $restantes personas - ${((restantes / _personasPorFila * (_isPortainerSelected ? 2 : 1))).ceil()} ${_isPortainerSelected ? "manos" : "filas"}";
          } else {
            resultado =
            "Quedan $diferencia personas - ${((diferencia / _personasPorFila * (_isPortainerSelected ? 2 : 1))).ceil()} ${_isPortainerSelected ? "manos" : "filas"}";
          }
        } else if (!list.contains(code) && list.contains(door)) {
          resultado = "No existe el código";
        } else if (list.contains(code) && !list.contains(door)) {
          resultado = "No existe el código puerta";
        } else {
          resultado = "No existen los códigos introducidos";
        }
      }
    } else {
      resultado = "Rellene los campos";
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(resultado, textAlign: TextAlign.center),
    ));
  }
}
