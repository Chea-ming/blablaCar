import '../models/courses_model.dart';
import '../repos/courses_repo.dart';

class CoursesMockRepo implements CourseRepo{
  Course c1 = Course(id: 'c1', name: 'Flutter');
  Course c2 = Course(id: 'c2', name: 'Java');
  Course c3 = Course(id: 'c3', name: 'Python');

  List<Course> courses = [];

  @override
  void addCourse(Course course) {
    courses.add(course);
  }

  @override
  List<Course> getAllCourses() {
    courses.add(c1);
    courses.add(c2);
    courses.add(c3);

    return courses;
  }
  
  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }
  
}