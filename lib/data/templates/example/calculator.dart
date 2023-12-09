import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> lists = [
      _renderContainer('AC', Colors.black54, 1),
      _renderContainer('+/-', Colors.black54, 1),
      _renderContainer('%', Colors.black54, 1),
      _renderContainer('/', Colors.orange, 1),
      _renderContainer('7', Colors.grey, 1),
      _renderContainer('8', Colors.grey, 1),
      _renderContainer('9', Colors.grey, 1),
      _renderContainer('*', Colors.orange, 1),
      _renderContainer('4', Colors.grey, 1),
      _renderContainer('5', Colors.grey, 1),
      _renderContainer('6', Colors.grey, 1),
      _renderContainer('-', Colors.orange, 1),
      _renderContainer('1', Colors.grey, 1),
      _renderContainer('2', Colors.grey, 1),
      _renderContainer('3', Colors.grey, 1),
      _renderContainer('+', Colors.orange, 1),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 20),
              child: Text('0', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        GridView.count(
          childAspectRatio: 2 / 1.5,
          shrinkWrap: true,
          crossAxisCount: 4,
          children: lists,
        ),
        Row(
          children: [
            _renderContainer('0', Colors.grey, 2),
            _renderContainer('.', Colors.grey, 1),
            _renderContainer('=', Colors.orange, 1),
          ],
        ),
      ],
    );
  }

  Widget _renderContainer(String text, Color color, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(),
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
        ),
      ),
    );
  }
}
