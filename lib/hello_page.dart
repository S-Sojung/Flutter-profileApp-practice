import 'package:flutter/material.dart';


class HelloPage extends StatefulWidget { // alt enter 하면 statefull stateless 왔다 갔다 가능.

  HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    print("나 또 실행 되나?");
    return Scaffold(
      appBar: AppBar(),
      body: Align( //센터로 보내고 싶으면 widget center, 혹은 widget Align : 기본 중앙 정렬
        alignment: Alignment.center,
        child: Column(  // ctrl ww ..
          children: [
            Text("Hello ${num}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 50),),
            ElevatedButton(
              onPressed: (){ // 변수값을 바꾸면 빌드를 다시 실행해줘야함
                // -> 하지만 플러터는 프레임워크기 때문에 우리에게 제어권이 없음 (리빌드를 못함)
                // 앱은 클라이언트 사이드 랜더링 해야하는데.... 제어권이 없네? (빌드가 다시 안되네...)
                // 상태가 없는 위젯은 리빌드할 권한이 없는것 -> 상태가 있는 위젯은 가능!
                // 이 빌드를 다시 실행할 수 있는 방법을 배우자 .
                //전체적으로 봤을 때... 상태가 변한 위젯만 다시 그리면 된다.

                //const를 붙이면 그림은 다시 그려질 수 있지만, 다시 new 되지 않음.
                //이미 메모리에 올려진 값은 그냥 그걸 쓰는거임.

                //빌드를 최소한으로 줄여서 그리기 위해 위젯을 따로 빌드를 둠

                setState(() {
                  //변경하고 싶은 상태값을 여기서 변경하면 rebuild 해주겠다.!
                  num++;
                });

                print("num: ${num}");
              },
              child: Text("변경",style: TextStyle(fontSize: 50)),)
            //인라인임... 인스팩터로 계속 확인해줘야함.
          ],
        ),
      ),
    );
  }
}

//다운 다음으로 오래 걸리는건 랜더링...
//변경 될 애 빼고 모두 const 를 붙여준다. 하지만... 그림을 다시그리는건 위젯 안에 있는 모든것을 그린다.
// ->이때, 따로 위젯으로 쪼개주면 얘만 리빌드 하면 된다.
// statusless 에 변수 만들거면 상수로 박아버리면 된다 ...
class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.num,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    return Text("Hello ${num}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 50),);
  }
}
