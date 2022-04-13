import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/constants/gender_constants.dart';

part 'character.g.dart';

@JsonSerializable(createToJson: false)
class Character {
  int id;
  String name;
  String image;
  @JsonKey(fromJson: GenderConstants.genderDecoder)
  Genders gender;

  Character({
    this.id = 0,
    this.name = '',
    this.image = '',
    this.gender = Genders.unknown,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
