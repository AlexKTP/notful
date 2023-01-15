import 'dart:core';
import 'note.dart';

class AudioNote {

  int id;
  String path;
  String title;
  List<Note>? notes;
  List<String>? tags;
  
  AudioNote({
    required this.id,
    required this.path,
    required this.title,
  });

  AudioNote.fromMap(Map<String, dynamic> data) :
        id = data['id'],
        path = data['path'],
        title = data['title'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'path': path
    };
  }

}