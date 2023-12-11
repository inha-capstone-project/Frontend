import 'package:flutter/material.dart';

class Snack extends StatelessWidget {
  const Snack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 520,
      height: 700,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 150),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                      ),
                      child: Icon(
                        Icons.arrow_upward,
                        size: 50,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    child: Icon(Icons.arrow_back, size: 50),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    child: Icon(Icons.arrow_downward_rounded, size: 50),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    child: Icon(Icons.arrow_forward_rounded, size: 50),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
