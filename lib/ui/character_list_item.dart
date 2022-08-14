import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/characters.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    required this.character,
    Key? key,
  }) : super(key: key);
  final Result character;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var url2 = '.jpg';
    if (character.thumbnail.extension == Extension.JPG) {
      url2 = '.jpg';
    } else {
      url2 = '.png';
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (character.thumbnail != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      width: 50,
                      height: 50,
                      imageUrl: character.thumbnail.path + url2,
                    ),
                  ),
                ],
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    character.name,
                    style: textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (character.description != null)
              Text(
                character.description,
                style: textTheme.bodyText2,
              ),
          ],
        ),
      ),
    );
  }
}
