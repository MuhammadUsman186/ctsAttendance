import 'package:cts_app/Screens/StudentProfile/std_profile.dart';
import 'package:cts_app/constants/images.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';

// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:camera/camera.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:proj/constants/app_sizes.dart';
// import 'package:proj/constants/images.dart';
// import 'package:proj/screens/student_list_grid/domain/student_grid_model.dart';
// import 'package:proj/screens/studentsProfile/presentation/student_profile.dart';
// import 'package:proj/utils/app_theme.dart';

// class StudentGridCard extends StatefulWidget {
//   const StudentGridCard({Key? key, required this.unRegistered, required this.student})
//       : super(key: key);
//   final bool unRegistered;
//   final StudentGridDatum student;

//   @override
//   State<StudentGridCard> createState() => _StudentGridCardState();
// }

// class _StudentGridCardState extends State<StudentGridCard> {
//   XFile? cameraPicture;

//   @override
//   Widget build(BuildContext context) {
//     final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
//     final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentProfile(studentId: widget.student.id!),)).then((value) async {
//           await CachedNetworkImage.evictFromCache(widget.student.image);
//           // ref
//           //     .read(studentProfileControllerProvider.notifier)
//           //     .getStudentDetail(widget.studentId.toString());
//         });
//       },
//       child: Card(
//         color: widget.unRegistered ? AppColors.cardBackgroundColor : Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side:
//               const BorderSide(color: AppColors.cardBackgroundColor, width: 1.5),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Image.asset(
//               //   Images.profileQuestion,
//               //   fit: BoxFit.fill,
//               // ),
//               CachedNetworkImage(
//                 imageUrl: widget.student.image ?? "",
//                 placeholder: (context, url) => Image.asset(
//                   Images.profileQuestion,
//                   color: AppColors.primaryColor,
//                 ),
//                 errorWidget:
//                     (context, url, error) =>
//                     Image.asset(
//                       Images.profileQuestion,
//                       color: AppColors.primaryColor,
//                     ),
//                 fit: BoxFit.cover,),
//               gapH16,
//               DottedBorder(
//                 dashPattern: const [8, 4],
//                 color: AppColors.cardBackgroundColor,
//                 customPath: (size) => Path()
//                   ..moveTo(0, 0)
//                   ..lineTo(isTablet || isLandscape ? MediaQuery.of(context).size.width / 5 - 50 : MediaQuery.of(context).size.width / 2.5 - 50, 0),
//                 child: Container(
//                   height: 0,
//                   color: Colors.transparent,
//                 ),
//               ),
//               gapH8,
//               Text(
//                 "${widget.student.firstName} ${widget.student.middleName ?? ""} ${widget.student.lastName}",
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class GridCard extends StatelessWidget {
  final String fname;
  final String image;
  final String lname;

  final int id;
  const GridCard(
      {required this.fname,
      required this.image,
      required this.lname,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StdProfile(
                    id: id,
                    fname: fname,
                    lname: lname,
                    image: image,
                  )),
        );
      },
      child: SizedBox(
        width: isLandscape
            ? (MediaQuery.of(context).size.width - 40) / 4
            : (MediaQuery.of(context).size.width - 40) / 2,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.blue)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    child: image == 'null' ||
                            image ==
                                'http://20.203.100.210/api/user/CTS/175.jpg/view'
                        ? Image.asset(Images.profileQuestion)
                        : Image.network(image)),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  // width: (MediaQuery.of(context).size.width - 70) / 2,
                  child: Container(
                    decoration: DottedDecoration(
                        shape: Shape.line,
                        linePosition: LinePosition.bottom,
                        dash: const <int>[8, 5],
                        color: AppColors.primaryColor,
                        strokeWidth: 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  fname,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    lname,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
