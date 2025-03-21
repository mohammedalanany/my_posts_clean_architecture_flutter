import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/post_entitiy.dart';
import '../screens/post_detail/post_detail.dart';

class PostWidget extends StatelessWidget {
  final PostEntity? post;

  const PostWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(context, PostsDetailsScreen.routeName,
            arguments: {'id': post?.id});
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            CachedNetworkImage(
                imageUrl: post!.urlToImage ?? "",
                imageBuilder: (context, imageProvider) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.08),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                          ),
                          child: const CupertinoActivityIndicator(),
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                          ),
                          child: const Icon(Icons.error),
                        ),
                      ),
                    )),
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              post!.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  post!.description ?? '',
                  maxLines: 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  post!.id.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
