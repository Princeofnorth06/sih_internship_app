import 'package:flutter/material.dart';
import 'package:sih_internship_app/main.dart';

class HeadDes extends StatelessWidget {
  const HeadDes(
      {super.key, required this.head, required this.des, required this.icon});
  final String head;
  final String des;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 136, 194, 241),
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5)),
      height: mq.height * 0.15,
      width: mq.width * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                head,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          Text(
            des,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 158, 6)),
          )
        ],
      ),
    );
  }
}
