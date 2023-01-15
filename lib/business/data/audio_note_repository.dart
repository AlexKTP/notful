import 'package:audio_notes_manager/business/data/database_helper.dart';
import 'package:audio_notes_manager/business/data/repository.dart';
import 'package:audio_notes_manager/business/model/audio_note.dart';

class AudioNoteRepository implements Repository {

  AudioNoteRepository(this._localDataSource);

  final DatabaseHelper _localDataSource;

  @override
  Future<int> create(entity) {
    return _localDataSource.createAudioNote(
        (entity as AudioNote).title, (entity).path);
  }

  @override
  Future<AudioNote> findById(id) {
    return _localDataSource.findById(id);
  }

  @override
  Future<void> delete(entity) {
    return _localDataSource.deleteNote((entity).id);
  }

  @override
  Future<List<AudioNote>> getAll() {
    return _localDataSource.getAudioNotes();
  }

  @override
  Future<int> update(entity) {
    return _localDataSource.updateNote(
        (entity as AudioNote).id, (entity).title, (entity).path);
  }
}
