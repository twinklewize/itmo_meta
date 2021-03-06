import 'package:flutter/material.dart';
import '../entities/post.dart';

class FeedProvider with ChangeNotifier {
  List<Post> posts = [
    Post(
      id: 'postId1',
      authorId: 'authorId1',
      dateTime: DateTime.now(),
      text: 'бипки, бипки и еще раз бипки!',
      title: 'бипки',
      howManyComments: 4,
      userWhoLikedIds: ['id1', 'id2'],
    ),
    Post(
      id: 'postId2',
      authorId: 'authorId2',
      dateTime: DateTime.now(),
      text: 'бипки, бипки и еще раз бипки!',
      title: 'бипки',
      howManyComments: 4,
      userWhoLikedIds: ['id1', 'id2'],
    ),
  ];

  // TODO заменить myId на реальный id текущего юзера
  void likeSpecificPost(String postId) {
    for (var post in posts) {
      if (post.id == postId) {
        if (post.userWhoLikedIds.contains('myId')) {
          post.userWhoLikedIds.removeWhere((id) => id == 'myId');
        } else {
          post.userWhoLikedIds.add("myId");
        }
      }
    }
    notifyListeners();
  }

  // получение писка постов конкретного юзера по id юзера
  Future<List<Post>> getPostsById(int userId) async {
    List<Post> result;
    // TODO добавить http запрос
    throw UnimplementedError();
    // return result;
  }
}
