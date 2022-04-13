import 'package:json_annotation/json_annotation.dart';

part 'character_detail.g.dart';

@JsonSerializable(createToJson: false)
class CharacterDetail {
  String name;
  String image;
  String gender;
  String status;

  CharacterDetail(
      {this.name = '', this.image = '', this.gender = '', this.status = ''});

  factory CharacterDetail.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailFromJson(json);
}
