

import 'package:batch_student_starter/model/batch.dart';

import '../../helper/objectbox.dart';
import '../../state/objectbox_state.dart';

class BatchDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  Future<int> addBatch(Batch batch) async {
    try {
      return objectBoxInstance.addBatch(batch);
    } catch (e) {
      return 0 ;
    }
  }

  Future<List<Batch>> getBatch() async {
    try {
      return objectBoxInstance.getAllBatch();
    } catch (e) {
      throw Exception('Error in getting all batch');
    }
  }
  
  
}