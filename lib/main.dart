// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_config.dart';
import 'tabs_page.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hi",
      home: Scaffold(body: SafeArea(child: AddNotes())),
    );
  }
}




class AddNotes extends StatelessWidget {
  final String title = "connected";
  final String content = "" ;
  final String topic = "";
  final String userId = "";

  @override
  Widget build(BuildContext context) {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  
    Future<void> addNote() {
      return notes.add({
        'title': title,
        'content': content,
        'topic': topic,
        'userId': userId,
      })
          .then((value) => print("Note Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return TextButton(
      onPressed: addNote,
      child: Text("Add Note",)
    );
  }
}
