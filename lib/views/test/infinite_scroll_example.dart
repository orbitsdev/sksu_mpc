import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sksumpc/api/api.dart';
import 'package:sksumpc/api/api_http.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/progress/loader.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/models/post.dart';

class InfiniteScrollExample extends StatefulWidget {
  @override
  _InfiniteScrollExampleState createState() => _InfiniteScrollExampleState();
}

class _InfiniteScrollExampleState extends State<InfiniteScrollExample> {
  List<Post> posts = [];
  bool isLoading = false;
  int limit = 30;
  int offset = 0;
  bool hasMore = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData();

    // Add scroll listener
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('I on the limit');
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> refresh() async {
    setState(() {
      posts = [];
      limit = 30;
      offset = 0;
      isLoading = false;
      hasMore = false;
    });

    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);

    final response =
        await ApiHttp().getRequest("${Api.infinitScroll}/$limit/$offset}");
    List<Post> newData = (response.data as List<dynamic>)
        .map((e) => Post.fromMap(e as Map<String, dynamic>))
        .toList();
    setState(() => isLoading = false);
    if (newData.isNotEmpty) {
      setState(() {
        posts.addAll(newData);
        offset = posts.length;
      });
    }

    if (newData.length < limit) {
      setState(() {
        hasMore = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll Example'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: posts.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < posts.length) {
              final post = posts[index];
              return Container(
                  margin: EdgeInsets.all(14),
                  color: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${post.title}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800)),
                      V(6),
                      Text("${post.body}", style: TextStyle(fontSize: 14)),
                    ],
                  ));
            } else {
              return Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child: isLoading
                          ? Loader()
                          : hasMore
                              ? Text('Load More Data ')
                              : Text('No More Data')));
            }
            // if (index < posts.length) {
            //   return ListTile(
            //     title: Text(post.title),
            //   );
            // } else  {
            //   return Center(child: Loader());
            // }
            // if (index < posts.length) {
            //   return ListTile(
            //     title: Text(post.title),
            //   );
            // } else if (isLoading) {
            //   return Padding(
            //     padding: EdgeInsets.symmetric(vertical: 16.0),
            //     child: Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //   );
            // } else {
            //   return Container();
            // }
          },
        ),
      ),
    );
  }
}
