class Employee {
  final int id;
  final String name;
  final int age;
  final int salary;

  const Employee({
    required this.id,
    required this.name,
    required this.age,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'age': int age,
        'salary': int salary,
      } =>
        Employee(id: id, name: name, age: age, salary: salary),
      _ => throw const FormatException('Failed to load employee data'),
    };
  }
}
