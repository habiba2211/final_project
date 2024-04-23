import 'package:final_project/features/home/presentation/widgets/history_column.dart';
import 'package:final_project/features/home/presentation/widgets/row_item.dart';
import 'package:final_project/features/home/presentation/widgets/search_item.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({
    super.key,
  });

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //extendBody: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text(
      //     'AI NABTA',
      //     style: TextStyle(
      //         fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      // ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50, bottom: 10, right: 20, left: 20),
        /* decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/77.jpg'),
            fit: BoxFit.cover,
          )),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FirstRow(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Welcom to AI NAPTA!',
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[900]),
              ),
            ),
            const SearchBox(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                'History',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: HistoryColumn()),
          ],
        ),
      ),
    );
  }
}
//Column(
//         children: [
//           if (GetIt.instance<HomeLayoutCubit>().img != null)
//             Image(
//               image: FileImage(GetIt.instance<HomeLayoutCubit>().img!.image),
//               width: double.infinity,
//               height: 300,
//             )
//         ],
//       ),
