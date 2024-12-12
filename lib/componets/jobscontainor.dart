import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/componets/icontext.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';

class Model extends StatelessWidget {
  const Model(
      {super.key,
      required this.title,
      required this.mode,
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
  final String location;
  final String mode;
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
    DateTime? postedon;
    if (dateposted != null && dateposted.isNotEmpty) {
      try {
        postedon = DateTime.parse(dateposted);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    Duration difference = now.difference(postedon!);

    String differenceFormatted = formatDuration(difference);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          left: mq.width * 0.03, right: mq.width * 0.03, top: mq.width * 0.03),
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
                  child: Image.network(companylogo))
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
                    location,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          IconText(
            text: mode,
            icons: Icons.work,
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
                  color: AppColors.primary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      size: mq.height * 0.02,
                      color: AppColors.background,
                    ),
                    SizedBox(
                      width: mq.width * 0.01,
                    ),
                    Text(
                      differenceFormatted,
                      style: const TextStyle(color: AppColors.background),
                    ),
                  ],
                ),
              ),
              SizedBox(width: mq.width * 0.1),
              Text(
                  'Apply till : ${DateFormat('yyyy-MM-dd').format(lasttoapply)}')
            ],
          ),
          SizedBox(
            height: mq.height * 0.025,
          ),
          Container(
            height: mq.height * 0.004,
            color: Colors.grey.shade300,
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

class Model2 extends StatelessWidget {
  const Model2(
      {super.key,
      required this.title,
      required this.mode,
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
  final String location;
  final String mode;
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
    DateTime? postedon;
    if (dateposted != null && dateposted.isNotEmpty) {
      try {
        postedon = DateTime.parse(dateposted);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    Duration difference = now.difference(postedon!);

    String differenceFormatted = formatDuration(difference);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54, width: 3),
        color: Colors.white10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          left: mq.width * 0.03, right: mq.width * 0.03, top: mq.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: mq.width * 0.5,
                    child: Text(
                      title,
                      maxLines: null,
                      style: const TextStyle(
                          color: AppColors.background,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.009,
                  ),
                  SizedBox(
                    width: mq.width * 0.5,
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
                  child: Image.network(companylogo))
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
                  width: mq.width * 0.6,
                  child: Text(
                    location,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.background),
                  ))
            ],
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          IconText(
            text: mode,
            icons: Icons.work,
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
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      size: mq.height * 0.02,
                      color: AppColors.background,
                    ),
                    SizedBox(
                      width: mq.width * 0.01,
                    ),
                    Text(
                      differenceFormatted,
                      style: const TextStyle(color: AppColors.background),
                    ),
                  ],
                ),
              ),
              SizedBox(width: mq.width * 0.05),
              Text(
                'Apply till : ${DateFormat('yyyy-MM-dd').format(lasttoapply)}',
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: mq.height * 0.025,
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
