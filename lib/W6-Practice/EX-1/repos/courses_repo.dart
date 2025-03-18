import '../models/courses_model.dart';

abstract class CourseRepo {

  List<Course> getAllCourses();

  void addCourse(Course course);

  void addScore(Course course, CourseScore score);
}