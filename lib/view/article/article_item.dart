import 'package:api_sample/api/qiita/model/qiita_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({
    required this.qiitaInfo,
    required this.onArticleClicked,
  });

  final QiitaInfo qiitaInfo;
  final ValueChanged onArticleClicked;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => onArticleClicked(qiitaInfo),
        child: SizedBox(
          height: 75,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: CachedNetworkImage(
                    imageUrl: qiitaInfo.qiitaUser!.profileImageUrl ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  qiitaInfo.title!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
