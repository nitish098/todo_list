// import 'package:flutter/material.dart';

class Task {
  final String id;
  String title;
  final String ownerId;
  List<String> sharedWith;
  DateTime lastUpdated;

  Task({
    required this.id,
    required this.title,
    required this.ownerId,
    this.sharedWith = const [],
    DateTime? lastUpdated,
  }) : lastUpdated = lastUpdated ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'ownerId': ownerId,
      'sharedWith': sharedWith,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      ownerId: map['ownerId'],
      sharedWith: List<String>.from(map['sharedWith'] ?? []),
      lastUpdated: DateTime.parse(map['lastUpdated']),
    );
  }
}

