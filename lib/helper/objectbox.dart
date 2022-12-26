import 'package:batch_student_starter/model/batch.dart';
import 'package:batch_student_starter/model/student.dart';
import 'package:batch_student_starter/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<Batch> _batch;
  late final Box<Student> _student;

  ObjectBoxInstance(this._store) {
    _batch = Box<Batch>(_store);
    _student = Box<Student>(_store);
    insertBatches();
  }

//initialization of objectBox
  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/student_course',
    );

    return ObjectBoxInstance(store);
  }

  int addBatch(Batch batch) {
    return _batch.put(batch);
  }

  List<Batch> getAllBatch() {
    return _batch.getAll();
  }

  int addStudent(Student student) {
    return _student.put(student);
  }

  List<Student> getAllStudent() {
    return _student.getAll();
  }

//when app is opened for the first time , insert some batches in the database
  void insertBatches() {
    List<Batch> lstBatches = getAllBatch();
    if (lstBatches.isEmpty) {
      addBatch(Batch('29-A'));
      addBatch(Batch('29-B'));
      addBatch(Batch('28-A'));
      addBatch(Batch('28-B'));
    }
  }
}
