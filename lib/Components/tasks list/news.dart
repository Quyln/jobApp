import 'package:duanmoi/Components/tasks%20list/new_class.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<NewsDetail> news = [
    NewsDetail(
        'https://th.bing.com/th/id/OIF.jUSYKj4KT3u1N1Oaqq09RQ?w=295&h=180&c=7&r=0&o=5&dpr=2&pid=1.7',
        'Chủ tịch Quốc hội phát động giải bóng đá dành cho công nhân Việt Nam',
        'Chiều 28.7, Chủ tịch Quốc hội Vương Đình Huệ đã chính thức phát động giải bóng đá Công nhân toàn quốc lần đầu tiên được tổ chức tại Việt Nam.ự kiện diễn ra tại Hội trường Diên Hồng, Tòa nhà Quốc hội, TP.Hà Nội trong khuôn khổ chương trình Diễn đàn người lao động năm 2023 với chủ đề “Hoàn thiện chính sách, pháp luật liên quan đến'),
    NewsDetail(
        'https://th.bing.com/th?id=OIF.Ii%2f3N6uNYOFH%2fYMCuyzZZg&w=304&h=180&c=7&r=0&o=5&dpr=2&pid=1.7',
        'Tôn vinh 167 công nhân nhận Giải thưởng Nguyễn Đức Cảnh',
        '167 công nhân lao động tiêu biểu, xuất sắc nhất trong các doanh nghiệp thuộc mọi thành phần kinh tế đã được Tổng liên đoàn Lao động (LĐLĐ) Việt Nam tôn vinh, trao tặng Giải thưởng Nguyễn Đức Cảnh lần thứ IV, năm 2023'),
    NewsDetail(
        'https://th.bing.com/th/id/OIP.K2J-ax9-gthNoetWkYjzBgHaFj?w=242&h=181&c=7&r=0&o=5&dpr=2&pid=1.7',
        'Nhiều gia đình công nhân con nằm giường, bố mẹ nằm dưới sàn, vỏn vẹn 10 m2',
        'Nhà ở cho người lao động là một trong những vấn đề được nhiều công nhân, viên chức, người lao động đặt ra tại Diễn đàn Người lao động 2023, do Chủ tịch Quốc hội Vương Đình Huệ chủ trì chiều 28.7')
  ];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: news
          .map((e) => Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 26, bottom: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Navigation.newdetail, arguments: e);
                  },
                  child: Container(
                      height: 200,
                      padding:
                          const EdgeInsets.only(top: 23, left: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                blurStyle: BlurStyle.outer,
                                color: Color.fromRGBO(0, 0, 0, 0.4))
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 140,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                e.image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 235,
                                  child: Text(
                                    e.title,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  height: 110,
                                  width: 235,
                                  child: Text(
                                    e.content,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 5,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ))
          .toList(),
    );
  }
}
