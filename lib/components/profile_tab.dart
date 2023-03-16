import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

//탭바 안에 탭바가 들어가면 multipleTickerProvider...
class _ProfileTabState extends State<ProfileTab> with SingleTickerProviderStateMixin{
  //TickerProvide 하지만 얘를 바로 with 하면 안됨 => 추상 클래스임...
  //문서를 찾아보면 SingleTickerProviderStateMixin 을 mixin 하면된다. 얘는 구현체임

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          //2개를 관리하며, 어느 위젯에서 도는지(얘는 자기 자신의 위젯에서 돈다)
          // ... TickerProvide 타입이 들어가야하기 때문에 mixin 해야함
          // 하지만 TabController 를 여기다 만들면 SingleTickerProviderStateMixin가 제어권 없기 때문에 전역으로 적어줘야한다.

          // controller: TabController(length: 2,vsync: this),
          controller: _tabController,
          tabs: [ //Tab 은 text, icon, child 중 하나가 들어가야한다.
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ]
        ),
        Expanded( // 이때, 안과 밖 둘다 감싸줘야한다.
          child: TabBarView(
              controller: _tabController,
              children: [
                //GridView와 GridView.builder의 차이 찾아보기
                GridView.builder(
                  itemCount: 42,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10, // 사이사이 간격
                    crossAxisCount: 3, // 한줄에 몇개?
                  ),
                  itemBuilder: (context, index) {
                    //얘네는 모든 사진을 한번에 다운받지 않음! (모든 사진을 다 볼지 모르겟으니까...)
                    //스크롤 할 때마다 간헐적으로 조금씩 다운 받아줌 ... 하지만 다운 받은 사진이 사라짐..
                    //즉, 사진첩이 15개 있다면, 그걸 계속 바꿔끼워준다 생각.
                    return CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/${index+1}/200/200",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                    // Image.network("https://picsum.photos/id/${index+1}/200/200");
                    //나중에는 Image.casingNetwork 한다.
                  },
                ),
                Container(color: Colors.grey,)
              ]
          ),
        )
      ],
    );
  }
}

