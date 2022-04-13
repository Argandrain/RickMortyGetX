class GenderConstants {
  static Genders genderDecoder(String gender) {
    if (gender == "Female") {
      return Genders.female;
    } else if (gender == "Male") {
      return Genders.male;
    } else if (gender == 'Genderless') {
      return Genders.genderless;
    } else {
      return Genders.unknown;
    }
  }
}

enum Genders { female, male, genderless, unknown }
