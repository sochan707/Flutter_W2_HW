import 'dart:math';

enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address({required this._street, required this._city, required this._zipCode});

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  final String _name;
  double _baseSalary;
  List<Skill> _skills;
  int _yearsOfExperience;
  Address _address;

  double _experienceBonus = 0.0;
  double _skillBonus = 0.0;
  double _totalSalary = 0.0;

  double get experienceBonus => _experienceBonus;
  double get skillBonus => _skillBonus;

  Employee({required this._name, required this._baseSalary, required this._skills, int this._yearsOfExperience = 0, required this._address});

  Employee.mobileDeveloper({required this._name, required this._baseSalary, int this._yearsOfExperience = 0, required this._address}) : _skills = [Skill.FLUTTER, Skill.DART];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  int get yearsOfExperience => _yearsOfExperience;
  Address get address => _address;

  double computeSalary({required Map<Skill,int> skillPrice, int experiencePrice = 0}){
    double totalSalary = 0;
    _experienceBonus = yearsOfExperience.toDouble() * (experiencePrice);
    _skillBonus = 0;
    
    for (var skill in skills){
      _skillBonus += (skillPrice[skill] ?? 0);
    }

    _totalSalary = _baseSalary + _experienceBonus + _skillBonus;

    return totalSalary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$${_baseSalary}');
    print('Experience Bonus: ${_experienceBonus}');
    print('Skill Bonus: ${_skillBonus}');
    print('Total Salary : ${_totalSalary}');
  }
}

void main() {
  Map<Skill,int> skillPrice = {
    Skill.FLUTTER : 5000,
    Skill.DART : 3000,
    Skill.OTHER : 1000
  };

  const int experiencePrice = 2000;

  Employee emp1 = Employee(name: "Mimi", baseSalary: 20000, skills: [Skill.OTHER], address: Address(street: "123", city: "Phnom Penh", zipCode: "12000"), yearsOfExperience: 2);

  emp1.computeSalary(skillPrice: skillPrice, experiencePrice: experiencePrice);

  emp1.printDetails();

  

  // var emp1 = Employee('Sokea', 40000);
  // emp1.printDetails();

  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();
}