import 'dart:async';

import 'package:audio_notes_manager/business/model/audio_note.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper();

  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE audio_note(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        path TEXT,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      );
      CREATE TABLE note(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      content TEXT,
      creationDate DATETIME,
      modificationDate DATETIME,
      FOREIGN KEY (audio_note_id) REFERENCES audio_note(id)
      )
      """);
  }

  Future<Database> getDb() async {
    return openDatabase(
      'ktp.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //CRUD

  //CREATE
  Future<int> createAudioNote(String? title, String? path) async {
    final db = await getDb();

    final data = {'title': title, 'path': path};
    final id = await db.insert('audio_note', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //READ
  Future<List<AudioNote>> getAudioNotes() async {
    final db = await getDb();
    var maps = await db.query('audio_note', orderBy: "id");
    var list = List.generate(maps.length, (i) {
      return AudioNote(
          id: maps[i]['id'] as int,
          path: maps[i]['path'] as String,
          title: maps[i]['title'] as String);
    });
    return list;
  }

  Future<AudioNote> findById(String id) async {
    final db = await getDb();
    var maps = await db
        .query("audio_note", where: "id = ?", limit: 1, whereArgs: [id]);
    var list = List.generate(maps.length, (i) {
      return AudioNote(
          id: maps[i]['id'] as int,
          path: maps[i]['path'] as String,
          title: maps[i]['title'] as String);
    });
    return list.first;
  }

  //UPDATE
  Future<int> updateNote(int id, String title, String? path) async {
    final db = await getDb();

    final data = {'title': title, 'path': path};

    final result =
        await db.update('audio_note', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  //DELETE
  Future<void> deleteNote(int id) async {
    final db = await getDb();
    try {
      await db.delete("audio_note", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an audio_note: $err");
    }
  }
}
