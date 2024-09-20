import 'package:flutter/material.dart';
import 'package:sih_internship_app/componets/icontext.dart';
import 'package:sih_internship_app/main.dart';

class Model extends StatelessWidget {
  const Model(
      {super.key,
      required this.title,
      required this.location,
      required this.companyname,
      required this.companylogo,
      required this.iswfh,
      required this.stipend,
      required this.duration,
      required this.employementtype,
      required this.lasttoapply,
      required this.dateposted});
  final String title;
  final List<String> location;
  final String companyname;
  final String companylogo;
  final bool iswfh;
  final String stipend;
  final String duration;
  final String employementtype;
  final String dateposted;
  final DateTime lasttoapply;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(lasttoapply);

    String differenceFormatted = formatDuration(difference);

    return Container(
      margin: EdgeInsets.symmetric(vertical: mq.height * 0.006),
      color: Colors.white,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(mq.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: mq.width * 0.6,
                    child: Text(
                      title,
                      maxLines: null,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.009,
                  ),
                  SizedBox(
                    width: mq.width * 0.6,
                    child: Text(
                      maxLines: null,
                      companyname,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: mq.width * 0.2,
                  height: mq.height * 0.1,
                  child: Image.asset("assets/images/icon.png"))
            ],
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 18,
              ),
              SizedBox(
                width: mq.width * 0.015,
              ),
              SizedBox(
                  width: mq.width * 0.8,
                  child: Text(
                    location.isEmpty ? "Work From Home" : location.join(' , '),
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ))
            ],
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          Row(
            children: [
              const IconText(
                text: "Starts Immediately",
                icons: Icons.play_circle_outline,
              ),
              IconText(
                text: duration,
                icons: Icons.calendar_month_outlined,
              ),
            ],
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          IconText(
            text: stipend,
            icons: Icons.money_outlined,
          ),
          SizedBox(
            height: mq.height * 0.025,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade300,
            ),
            child: Text(employementtype),
          ),
          SizedBox(
            height: mq.height * 0.025,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                      const Color.fromARGB(255, 1, 139, 253).withOpacity(0.2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      size: mq.height * 0.02,
                    ),
                    Text(differenceFormatted),
                  ],
                ),
              ),
              SizedBox(width: mq.width * 0.1),
              Text('Date Posted : $dateposted')
            ],
          ),
          SizedBox(
            height: mq.height * 0.025,
          ),
          Container(
            height: mq.height * 0.004,
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View details',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3))),
                  onPressed: () {},
                  child: const Text('    Apply Now    ',
                      style: TextStyle(color: Colors.white)))
            ],
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} days agos';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours agos';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes agos';
    } else {
      return 'Just now';
    }
  }
}
