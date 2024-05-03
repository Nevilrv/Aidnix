import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FamilyMemberController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();

  String selectGender = "";
  String selectRelation = "";

  List genderList = ["Female", "Male"];
  List relationList = ["Husband", "Wife", "Daughter", "Son", "Sister", "Brother"];
  List<Map<String, dynamic>> familyDetail = [
    {
      "name": "Kapil Darsan",
      "relation": "Husband",
      "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"
    },
    {
      "name": "Kanak Sharma",
      "relation": "Sister",
      "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"
    },
    {
      "name": "Konika Sharma",
      "relation": "Daughter",
      "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"
    },
    {
      "name": "Kartik Sharma",
      "relation": "Son",
      "image": "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    }
  ];
}
