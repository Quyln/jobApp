class NewsDetail {
  String image;
  String content;
  String title;
  NewsDetail({required this.image, required this.title, required this.content});

  static NewsDetail fromJson(dynamic data) {
    return NewsDetail(
        image: data['image'], title: data['title'], content: data['content']);
  }
}
