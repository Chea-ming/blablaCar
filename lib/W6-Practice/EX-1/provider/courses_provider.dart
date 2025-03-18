
import 'package:flutter/material.dart';
import '../models/courses_model.dart';
import '../repos/courses_mock_repo.dart';

class CourseModel extends ChangeNotifier{
  final List<Course> _courses = CoursesMockRepo().getAllCourses();
  
  List<Course> get courses => _courses;

  Course getCourse(String id) => _courses.firstWhere((course) => course.id == id);

  void addScore(String id, CourseScore score) {
    final course = _courses.firstWhere((course) => course.id == id);
    course.scores.add(score);
    notifyListeners();
  }
}