import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/job_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/models/courses_model.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/courses_view.dart';

class CourseCard extends StatefulWidget {
  final CourseModel course;

  const CourseCard({super.key, required this.course});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  final JobController jobController = JobController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.course.hubId != null) {
      print("call ho raha hu");
      
    }
    print("call ho raha hu 2 ${widget.course.hubId}");
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding for inner content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail image with rounded corners
          ClipRRect(
            //  borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.course.thumbnail,
              width: mq.width * 0.93,
              height: mq.height * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.course.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.background),
          ),
          Text(
            jobController.hub.value.name ?? "",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.background),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(
                        () => CourseDetailsScreen(courseId: widget.course.id));
                  },
                  child: const Text(
                    'View Details',
                    style: TextStyle(color: AppColors.primary),
                  )),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Enroll',
                    style: TextStyle(color: AppColors.primary),
                  )),
            ],
          ),
          // Space between image and content
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Course title with style
          //       Text(
          //         course.title,
          //         style: Theme.of(context).textTheme.titleLarge?.copyWith(
          //               fontWeight: FontWeight.bold,
          //             ),
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //       const SizedBox(
          //           height: 8), // Space between title and description
          //       // Course description with style
          //       Text(
          //         course.description,
          //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //               color: Colors.grey[600],
          //             ),
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //       const SizedBox(height: 16), // Space before action buttons
          //       // Row with action buttons (e.g., Enroll Now or Learn More)
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           TextButton(
          //             onPressed: () {
          //               // Add your action here
          //             },
          //             child: const Text('Learn More'),
          //           ),
          //           ElevatedButton(
          //             onPressed: () {
          //               // Add your action here
          //             },
          //             child: const Text('Enroll'),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.background,
            height: 2,
          )
        ],
      ),
    );
  }
}
