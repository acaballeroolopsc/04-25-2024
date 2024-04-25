// ignore_for_file: non_constant_identifier_names

import 'dart:core';

// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';


class FireStoreService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');


  // create
  Future addTask(String task) {
    return tasks.add({
      'task': task,
      'time_stamp': Timestamp.now(),
    });
  }


  //read
  Stream get getTasks {
    return tasks
        .orderBy(
          'time_stamp',
          descending: true,
        )
        .snapshots();
  }


  //update
  Future updateTask(
    String docID,
    String newTask,
  ) {
    return tasks.doc(docID).update({
      'task': newTask,
      'time': Timestamp.now(),
    });
  }


  //delete
  Future deleteTask(String docID) {
    return tasks.doc(docID).delete();
  }
}

mixin instance {
}

class Timestamp {
  static now() {}
}

class FirebaseFirestore {
  // ignore: prefer_typing_uninitialized_variables
  static var instance;
}

class CollectionReference {
    add(Map<String, dynamic> map) {}
  
  orderBy(String s, {required bool descending}) {}
  
  doc(String docID) {}
  
  Future (Map<String, dynamic> map) {}
}

mixin Future {
}




