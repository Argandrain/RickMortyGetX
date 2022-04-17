import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/models/character/character.dart';
import 'package:rick_and_morty/repositories/data_repository.dart';
import 'package:rick_and_morty/screens/character_detail_page/character_detail_page.dart';

class HomePageController extends GetxController {
  final DataRepository _dataRepository = Get.put(DataRepository());

  RxList<Character> characters = <Character>[].obs;

  RxBool onAwait = false.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    downloadNextPage();
    scrollController.addListener(() {
      if ((scrollController.position.pixels >
              scrollController.position.maxScrollExtent - 500) &&
          (!onAwait.value)) {
        downloadNextPage();
      }
      super.onInit();
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  Future<void> downloadNextPage() async {
    onAwait.value = true;
    characters.value = await _dataRepository.downLoadNextPage();
    onAwait.value = false;
  }

  Future<void> routeToItemDetail(int characterDetailId) async {
    await Get.to(() => CharacterDetailPage(id: characterDetailId));
  }
}
