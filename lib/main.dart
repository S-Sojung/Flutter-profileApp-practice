import 'package:flutter/material.dart';
import 'package:flutter_profile/components/profile_tab.dart';
import 'package:flutter_profile/hello_page.dart';
import 'package:flutter_profile/theme.dart';

import 'components/profile_buttons.dart';
import 'components/profile_count_info.dart';
import 'components/profile_drawer.dart';
import 'components/profile_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(), //HelloPage()
      theme: theme(), //클래스로 감싸진게 아니라서 new 할 필요없이 함수를 바로 호출
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //왼쪽에 있으면 Drawer, 오른쪽에 있으면 endDrawer
      //endDrawer를 클릭하면 이 Container가 나온다는 의미
      //Refactor Extract Flutter Widget 으로 만들어서 다른데서 찾을 수 있도록 해줌
      endDrawer: ProfileDrawer(),
      appBar: _appBar(), //얘는 이 파일 안에서만 접근 할 수 있도록 해줌
      // 기본은 Column 이었음 헤더에 고정
      // 만약 List view 가 되면 바디의 크기가 제약이 없어진다. Expanded를 하면 터져버림.
      body: NestedScrollView(  //리스트 안의 리스트가 다 확장되도록 함
        //ListView 처럼 작동하는데.. List 안에 List가 있을 경우 사용.
          body: ProfileTab(), //크기를 알 수 없는 List : 원래는 동적으로 다 크키 계산 하도록 해야함...
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList( // 크기를 알 수 있는 List
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20,),
                  ProfileHeader(),
                  SizedBox(height: 20,),
                  ProfileCountInfo(),
                  SizedBox(height: 20,),
                  ProfileButtons(),
                  //암튼 ListView에서 높이 제한이 없는 자식을 가질 수 없다.
                ])
              )
            ]; //SliverList 찢어진 조각 리스트
          },
      ),
    );
  }
}








AppBar _appBar() {
  return AppBar(
    leading: Icon(Icons.arrow_back_ios), // 왼쪽에 있는 건 리딩.
    centerTitle: true,
    title: Text("Profile"),
    // actions: [Icon(Icons.menu)], //오른쪽에 있는건 메뉴
  );
}