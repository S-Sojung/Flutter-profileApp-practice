import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          SizedBox(width: 20,),
          _buildHeaderAvatar(),
          SizedBox(width: 20,),
          _buildHeaderProfile(),
        ]
    );
  }

  Column _buildHeaderProfile() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("GetInThere", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
            Text("프로그래머/작가/강사", style: TextStyle(fontSize: 20),),
            Text("데어 프로그래밍", style: TextStyle(fontSize: 15),),
          ],
        );
  }

  SizedBox _buildHeaderAvatar() {
    return SizedBox(width: 100,height: 100, //얘로 크기 맞춰주는 것임
          child: CircleAvatar( //사이즈가 없음!!
            backgroundImage: AssetImage("assets/avatar.png"),
          ),
        );
  }
}