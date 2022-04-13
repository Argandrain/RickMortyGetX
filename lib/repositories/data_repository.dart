import 'package:get/get.dart';
import 'package:rick_and_morty/constants/errors.dart';
import 'package:rick_and_morty/models/character/character.dart';
import 'package:rick_and_morty/models/character_detail/character_detail.dart';
import 'package:rick_and_morty/services/net_service.dart';

class DataRepository extends GetxService {
  final NetService _netService = NetService();
  int _pageToDownload = 1;
  int _maxPages = 0;
  final List<Character> _characterList = <Character>[];

  Future<List<Character>> downLoadNextPage() async {
    if ((_maxPages == 0) || (_pageToDownload <= _maxPages)) {
      try {
        var result = await _netService.getRequestJson(
            command: "character?page=$_pageToDownload");
        try {
          if (_maxPages == 0) {
            _maxPages = result["info"]["pages"];
          }
          result["results"].forEach((value) {
            _characterList.add(Character.fromJson(value));
          });
          _pageToDownload++;
        } catch (e) {
          throw ParseError();
        }
      } catch (e) {
        rethrow;
      }
    }
    return _characterList;
  }

  Future<CharacterDetail> getCharacterDetail(int number) async {
    try {
      var result =
          await _netService.getRequestJson(command: "character/$number");
      try {
        return CharacterDetail.fromJson(result);
      } catch (e) {
        throw ParseError();
      }
    } catch (e) {
      rethrow;
    }
  }
}
