////var tipResult = "";
////TextEditingController controller = new TextEditingController();
////TextEditingController tipController = new TextEditingController();
////
////
////
////Center(
////child: Theme(
////data: new ThemeData(
////primaryColor: Colors.green,
////textTheme: TextTheme()
////),
////child: Column(
////mainAxisAlignment: MainAxisAlignment.center,
////children: <Widget>[
////new Padding(
////padding: EdgeInsets.all(15.0),
////child: new TextField(
////keyboardType: TextInputType.number,
////decoration: InputDecoration(
////labelText: '농약',
////hintText: '농약을 입력하세요',
////prefixIcon: Icon(Icons.attach_money),
////border: OutlineInputBorder(
////borderRadius: BorderRadius.all(
////Radius.circular(25.0)))),
////
////controller: controller,
////),
////),
////new Padding(
////padding: EdgeInsets.all(15.0),
////child: new TextField(
////keyboardType: TextInputType.number,
////decoration: InputDecoration(
////labelText: '비율',
////hintText: '비율을 입력하세요',
////prefixIcon: Icon(Icons.show_chart),
////border: OutlineInputBorder(
////borderRadius: BorderRadius.all(
////Radius.circular(25.0)))),
////controller: tipController,
////),
////),
////new Text('비율: $tipResult', style: TextStyle(fontWeight: FontWeight.bold))
////],
////),
////),
////)
////
////
////
////
////floatingActionButton: FloatingActionButton(
////onPressed: _tipCalc,
////tooltip: 'tip calc',
////child: Text('계산')
////),
////
////
////
////
////
////
//////
////void _tipCalc() {
////  setState(() {
////    int money = int.parse(controller.text);
////    int tip = int.parse(tipController.text);
////    print(money);
////    print(tip);
////
////    var result = money + (money * (tip / 100));
////    print((money * (tip / 100)));
////    tipResult = result.toString();
////  });
////}
//
//
//
//
//
//
//
//
//
//
//
//
//createCal(context) {
//  TextEditingController customController = TextEditingController();
//  TextEditingController customController2 = TextEditingController();
//
//  return showDialog(
//      context: context,
//      builder: (context) {
//        return AlertDialog(
//          title: Text('농약 계산기'),
//          content: Column(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              TextField(
//                controller: customController,
//                decoration: InputDecoration(labelText: "농약"),
//              ),
//              TextField(
//                controller: customController2,
//                decoration: InputDecoration(labelText: "비율"),
//              ),
//            ],
//          ),
//          actions: <Widget>[
//            MaterialButton(
//              elevation: 5.0,
//              child: Text('계산하기'),
//              onPressed: () {},
//            )
//          ],
//        );
//      });
//}