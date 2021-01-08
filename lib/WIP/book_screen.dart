// import 'package:flutter/material.dart';
// import 'package:sliver_grouped_list/sliver_grouped_list.dart';

// class BookScreen extends StatefulWidget {
//   @override
//   _BookScreenState createState() => _BookScreenState();
// }

// class _BookScreenState extends State<BookScreen> {
//   static const double _kHeight = 150.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF000000),
//         title: Text("Nopal Daily App"),
//         centerTitle: true,
//       ),
//       body: SliverGroupedList<String, String>(
//         data: {
//           'A': ['My best friend', 'Good friend of mine', 'Guy I do not know'],
//           'B': ['My cat', 'My dog', 'My fish', 'My bird'],
//           'C': ['My mom', 'My dad', 'My sis']
//         },
//         header: SliverGrid.count(
//           crossAxisCount: 3,
//           children: [
//             Container(color: Colors.white, height: _kHeight),
//             Container(color: Colors.black, height: _kHeight),
//             Container(color: Colors.grey, height: _kHeight),
//             Container(color: Colors.grey, height: _kHeight),
//             Container(color: Colors.white, height: _kHeight),
//             Container(color: Colors.black, height: _kHeight),
//             Container(color: Colors.black, height: _kHeight),
//             Container(color: Colors.grey, height: _kHeight),
//             Container(color: Colors.white, height: _kHeight),
//           ],
//         ),
//         bodyHeaderMinHeight: 60.0,
//         bodyHeaderMaxHeight: 100.0,
//         bodyHeaderPinned: true,
//         bodyHeaderFloating: false,
//         bodyHeaderBuilder: (_, header) => Container(
//           alignment: Alignment.center,
//           child: Text(
//             header,
//             style: TextStyle(color: Colors.white),
//           ),
//           color: Colors.blue,
//         ),
//         bodyEntryBuilder: (_, item) => Card(
//             color: Colors.lightBlueAccent,
//             child: Container(
//                 height: _kHeight,
//                 alignment: Alignment.center,
//                 child: Text(
//                   item,
//                   style: TextStyle(color: Colors.white),
//                 ))),
//         onItemTap: (item) => print(item),
//         footer: SliverFixedExtentList(
//           itemExtent: _kHeight,
//           delegate: SliverChildListDelegate(
//             [
//               Container(color: Colors.black),
//               Container(color: Colors.white),
//               Container(color: Colors.grey),
//               Container(color: Colors.black),
//               Container(color: Colors.white),
//               Container(color: Colors.grey),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
