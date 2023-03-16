
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView())
        //이때, 남아있는 칸을 모두 차지하기 위함임.
        //근데 그 부모가 다 차지해야만 얼마나 차지해야할지 알기때문에 main에서도 해줘야함
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.directions_car),),
          Tab(icon: Icon(Icons.directions_transit),),
        ]
      );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemCount: 42,
              itemBuilder: (context,index){
                return Image.network("https://picsum.photos/id/${index+1}/200/200");
              }
          ),
          Container(color: Colors.red,),
        ]
    );
  }
}

