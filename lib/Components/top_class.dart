class ThongBao {
  String title;
  String subtitle;

  ThongBao({required this.title, required this.subtitle});

  static ThongBao fromJson(dynamic data) {
    return ThongBao(title: data['title'], subtitle: data['subtitle']);
  }
}
