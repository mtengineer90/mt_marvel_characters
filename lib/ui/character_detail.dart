
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/characters.dart';

class CharacterDetail extends StatelessWidget {
  final Result result;

  const CharacterDetail(this.result);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var url2 = '.jpg';
    if(result.thumbnail.extension == Extension.JPG)
    {
      url2 = '.jpg';
    }
    else {
      url2 = '.png';
    }
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.thumbnail.path != null) ...[
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: 150,
                  height: 150,
                  imageUrl: result.thumbnail.path + url2,
                ),
              ),
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.name,
                      style: textTheme.subtitle1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text('Id: '+
                        result.id.toString(),
                        style: textTheme.subtitle2,
                      ),
                    ),
                    if (result.modified != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text('Date: '+
                          result.modified,
                          style: textTheme.subtitle2,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (result.description != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              result.description,
              style: textTheme.subtitle1,
            ),
          ),
      ],
    );
  }
}

