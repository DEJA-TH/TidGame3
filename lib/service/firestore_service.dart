import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tidgame3/model/crud_firesore_node.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
  FirestoreService._internal();
  Firestore _db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }

  Stream<List<Note>> getNotes() {
    return _db.collection('post').snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => Note.fromMap(doc.data, doc.documentID),
      ).toList(),
    );
  }

  Future<void> addPost(Note note)async{
    return _db.collection('post').add(note.toMap());
  }

  Future<void> deletePost(String id)async{
    return _db.collection('post').document(id).delete();
  }

  Future<void> updatePost(Note note)async{
    return _db.collection('post').document(note.id).updateData(note.toMap());
  }
}