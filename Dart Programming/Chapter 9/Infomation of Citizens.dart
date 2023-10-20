void main() {
  Citizen person = Citizen(
    gender: "Male",
    name: "George",
    dateOfBirth: 19980322,
    nationality: "Canada",
  );
  
  /* write your code here */
  person.printCitizen();
}

class Citizen {
  String gender;
  String name;
  int dateOfBirth;
  String nationality;
	
	/* write your code here */
  Citizen({required this.gender, required this.name, required this.dateOfBirth, required this.nationality});
  
  void printCitizen() {
    print('gender: $gender,');
    print('name: $name,');
    print('dateOfBirth: $dateOfBirth,');
    print('nationality: $nationality,');
  }

}


