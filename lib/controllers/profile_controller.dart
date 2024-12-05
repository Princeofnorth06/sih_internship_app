import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih_internship_app/models/profile_model.dart';

class ProfileController extends GetxController {
  var userProfile = UserProfile(
    uid: '123456',
    email: 'johndoe@example.com',
    isPaid: true,
    profileData: ProfileData(
      name: 'Prince',
      profileImage: 'assets/images/profile.jpeg',
      profileImagebackground: 'assets/images/profilebackground.png',
      address: 'San Francisco, CA',
      dob: DateTime(1990, 6, 15),
      role: 'Software Engineer',
      contactInfo: ContactInfo(
        phone: '+1234567890',
        email: 'johndoe@example.com',
        portfolio: 'https://portfolio.com/johndoe',
        linkedIn: 'https://linkedin.com/in/johndoe',
        github: 'https://github.com/johndoe',
        twitter: 'https://twitter.com/johndoe',
        instagram: 'https://instagram.com/johndoe',
        youtube: 'https://youtube.com/johndoe',
        kaggle: 'https://kaggle.com/johndoe',
        whatsapp: '+1234567890',
      ),
      about:
          'A passionate developer with 5+ years of experience in full-stack development.',
      skills: ['Flutter', 'Dart', 'React', 'Node.js', "Communication"],
      experiences: [
        Experience(
          title: 'Software Engineer',
          company: 'TechCorp',
          location: 'San Francisco, CA',
          startDate: DateTime(2020, 5),
          endDate: DateTime.now(),
          description: 'Developing full-stack applications for clients.',
        ),
        Experience(
          title: 'Junior Developer',
          company: 'DevStartup',
          location: 'New York, NY',
          startDate: DateTime(2018, 6),
          endDate: DateTime(2020, 4),
          description: 'Built and maintained web applications.',
        ),
      ],
      education: [
        Education(
          degree: 'BSc Computer Science',
          school: 'XYZ University',
          field: 'Computer Science',
          startDate: DateTime(2014, 9),
          endDate: DateTime(2018, 5),
          description: 'Studied software development and data structures.',
        ),
        Education(
          degree: 'BSc Computer Science',
          school: 'XYertyukZ University',
          field: 'Computer Science and Research',
          startDate: DateTime(2019, 9),
          endDate: DateTime(2024, 5),
          description: 'Research.',
        ),
      ],
    ),
  ).obs;

  final ImagePicker _picker = ImagePicker();

  // Function to update profile image
  Future<void> updateProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userProfile.update((profile) {
        profile?.profileData.profileImage = image.path;
      });
    }
  }

  // Function to update cover image
  Future<void> updateProfileBackgroundImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userProfile.update((profile) {
        profile?.profileData.profileImagebackground = image.path;
      });
    }
  }

  // Function to add a skill
  void addSkill(String skill) {
    if (!userProfile.value.profileData.skills.contains(skill)) {
      userProfile.update((profile) {
        profile?.profileData.skills.add(skill);
      });
    }
  }

  // Function to remove a skill
  void removeSkill(String skill) {
    userProfile.update((profile) {
      profile?.profileData.skills.remove(skill);
    });
  }

  // Function to save the profile
  void saveProfile() {
    // Save profile data to database or API
    // Placeholder code to simulate saving
    print('Profile saved: ${userProfile.value.profileData.name}');
  }
}
