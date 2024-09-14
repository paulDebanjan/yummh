import 'package:flutter/material.dart';
import '../models/post.dart';
import '../components/post_card.dart';

class PostSection extends StatelessWidget {
  final List<Post> posts;
  const PostSection({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Friend\'s Activity',
              style: TextStyle(
                fontSize:24,
                fontWeight: FontWeight.bold,
              )
            )
          ),
          //5
          // TODO: Add Post List View
          //1
          ListView.separated(
            //2
            primary: false,
            //3
            shrinkWrap: true,
            //4
            scrollDirection: Axis.vertical,
            //5
            physics: NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            //6
            itemBuilder: (context, index) {
              return PostCard(post: posts[index],);
            },
            separatorBuilder: (context, index) {
              //7
              return const SizedBox(height: 6);
            },
          )
        ]
      )
    );
  }
}
