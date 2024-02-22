import 'dart:convert';

import 'package:bloc_demo/modules/homepage/presentation/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeRepository {
  Future<List<Employee>> fetchEmployees() async {
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Employee> employees =
          jsonList.map((json) => Employee.fromJson(json)).toList();
      return employees;
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
