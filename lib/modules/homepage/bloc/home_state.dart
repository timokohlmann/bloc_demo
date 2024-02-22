import 'package:bloc_demo/modules/homepage/presentation/employee_model.dart';

class MyHomePageState {
  final int counter;
  MyHomePageState({this.counter = 0});

  MyHomePageState copyWith({int? counter}) {
    return MyHomePageState(
      counter: counter ?? this.counter,
    );
  }
}

class EmployeesInitial extends MyHomePageState {}

class EmployeesLoading extends MyHomePageState {}

class EmployeesLoadSuccess extends MyHomePageState {
  final List<Employee> employees;

  EmployeesLoadSuccess(this.employees);
}

class EmployeesLoadFailure extends MyHomePageState {
  final String error;

  EmployeesLoadFailure(this.error);
}
