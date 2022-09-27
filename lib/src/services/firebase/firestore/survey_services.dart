import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurveyServices {
  final Reader _read;
  SurveyServices(this._read);
  final _firestore = FirebaseFirestore.instance;

  // get All available surveys
  Future<List<QueryDocumentSnapshot>> getSurveys() async {
    try {
      final surveys = await _firestore.collection('surveys').get();
      return surveys.docs;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
