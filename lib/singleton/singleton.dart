import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Singleton {
  Singleton();

  static final instance = Singleton();

  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference mainCollection = FirebaseFirestore.instance.collection("TODO");

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  // ...

  // void searchTask(String query, allTasks, setState) {
  //   var tasks = allTasks.where((task) {
  //     final titleLower = task.taskTitle.toLowerCase();
  //     final subTitleLower = task.taskCategory.toLowerCase();

  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         subTitleLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     query = query;
  //     tasks = tasks;
  //   });
  // }

}
