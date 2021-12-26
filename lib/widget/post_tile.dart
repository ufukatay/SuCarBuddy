import 'package:flutter/material.dart';
import 'package:projedeneme/model/post.dart';
import 'package:projedeneme/utils/colors.dart';
import 'package:projedeneme/utils/styles.dart';

class PostTile extends StatelessWidget {

  final Post post;
  final VoidCallback delete;

  const PostTile({required this.post, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shadowColor: AppColors.primaryColor,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                post.text,
                style: kCardTextLabel,
              ),
            ),

            Row(
              children: [
                Text(
                  post.date,
                  style: kSubtitleLabel,
                ),

                Spacer(),

                Icon(
                  Icons.thumb_up,
                  color: AppColors.primaryColor,
                  size: 14,
                ),
                Text(
                  ' x ${post.likeCount}',
                  style: kSubtitleLabel,
                ),

                SizedBox(width: 16,),

                Icon(
                  Icons.comment,
                  size: 14,
                  color: AppColors.primaryColor,
                ),

                Text(
                  ' x ${post.commentCount}',
                  style: kSubtitleLabel,
                ),

                SizedBox(width: 16,),

                IconButton(
                  onPressed: delete,
                  padding: EdgeInsets.all(0),
                  iconSize: 14,
                  splashRadius: 24,
                  color: Colors.red,
                  icon: Icon(
                    Icons.delete,
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