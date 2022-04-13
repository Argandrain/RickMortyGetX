import 'package:get/get.dart';
import 'package:rick_and_morty/models/character_detail/character_detail.dart';
import 'package:rick_and_morty/repositories/data_repository.dart';

class CharacterDetailController extends GetxController {
  final DataRepository _dataRepository = Get.find();
  final int _id;
  Rx<CharacterDetail> character = CharacterDetail().obs;
  RxBool onAwait = false.obs;
  CharacterDetailController({required int id}) : _id = id {
    downloadCharacterDetail();
  }

  Future<void> downloadCharacterDetail() async {
    onAwait.value = true;
    character.value = await _dataRepository.getCharacterDetail(_id);
    onAwait.value = false;
  }
}
