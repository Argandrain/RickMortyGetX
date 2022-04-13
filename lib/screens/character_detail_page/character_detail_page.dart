import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/screens/character_detail_page/character_detail_controller.dart';

class CharacterDetailPage extends StatelessWidget {
  late final CharacterDetailController _characterDetailController;
  CharacterDetailPage({Key? key, required int id}) : super(key: key) {
    _characterDetailController = Get.put(CharacterDetailController(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(_characterDetailController.character.value.name)),
          body: _characterDetailController.onAwait.value
              ? const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: _characterDetailController
                                .character.value.image,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Name: ' +
                                _characterDetailController.character.value.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Gender: ' +
                                _characterDetailController
                                    .character.value.gender,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Status: ' +
                                _characterDetailController
                                    .character.value.status,
                            style: const TextStyle(fontSize: 18),
                          )
                        ]),
                  ),
                )),
    );
  }
}
