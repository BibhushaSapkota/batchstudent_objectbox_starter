import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/student.dart';
import '../../state/objectbox_state.dart';

class StudentDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  Future<int> addStudent(Student student) async {
    try {
      return objectBoxInstance.addStudent(student);
    } catch (e) {
      return 0 ;
    }
  }

  Future<List<Student>> getStudents()async{
    try {
      return objectBoxInstance.getAllStudent();
    } catch (e) {
      throw Exception('Error in getting all student');
    }
  }
  
  
}
