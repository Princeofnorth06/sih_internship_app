import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'dart:async';

import 'package:sih_internship_app/componets/customhead_dis.dart';
import 'package:sih_internship_app/componets/jobscontainor.dart';
import 'package:sih_internship_app/controllers/job_controller.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/reopos/courses_repo.dart';
import 'package:sih_internship_app/screens/course.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart';
import 'package:sih_internship_app/screens/profile/profile.dart'; // Import for Timer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileController profileController = Get.put(ProfileController());
  JobController jobController = Get.put(JobController());
  final PageController _controller = PageController();
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    Get.put(ProfileController())
        .getUserById(Get.put(ProfileController()).uid.value);
    Get.put(JobController()).getAllJobs();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        int nextPage = (_controller.page!.toInt() + 1) % 3; // Number of pages
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Getting screen size

    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(() => Profile());
                          },
                          child: Obx(() =>
                              profileController.profileImage.value != null &&
                                      profileController
                                          .profileImage.value!.path.isNotEmpty
                                  ? CircleAvatar(
                                      backgroundColor: AppColors.background,
                                      backgroundImage: NetworkImage(
                                          profileController.profile.value))
                                  : const CircularProgressIndicator())),
                      const SizedBox(
                        width: 5,
                      ),
                      Obx(
                        () => profileController
                                .userProfile.value.payload.userName.isNotEmpty
                            ? Text(
                                'Hii, ${profileController.userProfile.value.payload.userName},\nWelcome to Rajasthan Connect ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.background),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.greyDark,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 5,
                              color: AppColors.primary,
                            )),
                        width: Get.width * 0.35,
                        height: 70,
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.work,
                                  size: 15,
                                  color: AppColors.background,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Total Jobs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: AppColors.background,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => jobController.jobs.value.jobs != null
                                  ? Text(
                                      jobController.jobs.value.jobs!.length
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: AppColors.background,
                                      ),
                                    )
                                  : const Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.background,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * 0.35,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.greyDark,
                            border: Border.all(
                              width: 5,
                              color: AppColors.primary,
                            )),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_box,
                                  size: 15,
                                  color: AppColors.background,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Applied',
                                  style: TextStyle(
                                      color: AppColors.background,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => profileController.userProfile.value.payload
                                      .jobsApplied.isNotEmpty
                                  ? Text(
                                      profileController.userProfile.value
                                          .payload.jobsApplied.length
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: AppColors.background,
                                      ),
                                    )
                                  : const Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.background,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        border: Border.all(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    height: 200,
                    child: PageView(
                      controller: _controller,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '#LearnGetHired',
                              style: TextStyle(color: Colors.blue),
                            ),
                            const Text(
                              'Good News,\nNow, you can learn from the Top Companies',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white54),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                width: mq.width * 0.4,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white60),
                                    onPressed: () {
                                      Get.to(() => const Course());
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Explore',
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '#Interview',
                              style: TextStyle(color: Colors.blue),
                            ),
                            const Text(
                              'Intresting,\nNow, you can give a Mock Interview through AI',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white54),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                width: mq.width * 0.4,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white60),
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Start',
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '#Resume',
                              style: TextStyle(color: Colors.blue),
                            ),
                            const Text(
                              'Build,\nGenerate your Resume with AI for Free',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white54),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                width: mq.width * 0.4,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white60),
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Build',
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Model2(
                  title: "FrontEnd Devloper",
                  mode: 'Onsite',
                  location: "Delhi",
                  companyname: "Ayur",
                  companylogo:
                      "https://static.wixstatic.com/media/fc6449_62f0d76eec3a402bafe4f72a4f0102b0~mv2.png/v1/crop/x_56,y_113,w_900,h_675/fill/w_202,h_154,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/AYUR%20May%202023.png",
                  iswfh: false,
                  stipend: "45K",
                  duration: "",
                  employementtype: "Full Time",
                  lasttoapply: DateTime(2025, 4, 24),
                  dateposted: "2024-12-05")
            ]),
          ),
        ));
  }
}
