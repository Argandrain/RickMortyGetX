import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/constants/gender_constants.dart';
import 'package:rick_and_morty/screens/home_page/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Characters Rick and Morty"),
        ),
        body: Obx(
          () => (_homePageController.onAwait.value &&
                  _homePageController.characters.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                )
              : SafeArea(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      itemExtent: 60,
                      controller: _homePageController.scrollController,
                      itemCount: _homePageController.characters.length,
                      itemBuilder: (context, i) => GestureDetector(
                            onTap: (() async =>
                                await _homePageController.routeToItemDetail(
                                    _homePageController.characters[i].id)),
                            child: ListTile(
                              leading: CachedNetworkImage(
                                imageUrl:
                                    _homePageController.characters[i].image,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              title:
                                  Text(_homePageController.characters[i].name),
                              trailing: Icon(genderIcon(
                                  _homePageController.characters[i].gender)),
                            ),
                          )),
                ),
        ));
  }
}

IconData genderIcon(Genders gender) {
  switch (gender) {
    case Genders.female:
      return Icons.woman;
    case Genders.male:
      return Icons.man;
    case Genders.genderless:
      return Icons.adb;
    case Genders.unknown:
      return Icons.question_mark;
  }
}
