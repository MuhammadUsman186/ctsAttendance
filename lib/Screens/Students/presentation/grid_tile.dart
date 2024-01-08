import 'package:cts_app/Screens/Students/presentation/grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridLayout extends StatelessWidget {
  final int length;
  final List data;
  // final int columnsize;
  const GridLayout({required this.data, required this.length, super.key});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: LayoutGrid(
        autoPlacement: AutoPlacement.rowSparse,
        rowGap: 10,
        columnSizes: isPortrait ? [1.fr, 1.fr] : [1.fr, 1.fr, 1.fr, 1.fr],
        rowSizes: isPortrait
            ? [for (var i = 0; i < length / 2; i++) auto]
            : [for (var i = 0; i < length / 4; i++) auto],
        children: [
          for (var i = 0; i < length; i++)
            GridCard(
              fname: data[i].firstName.toString(),
              lname: data[i].lastName.toString(),
              image: data[i].image.toString(),
              id: data[i].id!.toInt(),
            )
        ],
      ),
    );
  }
}

// int columnsize;
    // if (length == 1) {
    //   columnsize = 1;
    // } else {
    //   columnsize = 2;
    // }
    // int rowsize = (length / 2).toInt();

    // if (length == 1) {
    //   rowsize = 1;
    // } else {
    //   rowsize = length.isEven ? rowsize : rowsize + 1;
    // }
    // List<GridCard> gridist1 = [];
    // var e = columnsize * rowsize;
    // if (rowsize == 1) {
    //   e;
    // } else {
    //   e = length.isOdd ? e - 1 : e;
    // }
    // for (var i = 0; i < e; i++) {
    //   gridist1.add(const GridCard());
    // }

    // int columnsize2;
    // List<GridCard> gridist2 = [];
    // if (length <= 4) {
    //   columnsize2 = 4;
    // } else {
    //   columnsize2 = 4;
    // }
    // int rowsize2 = (length / 4).toInt();
    // if (length <= 4) {
    //   rowsize2 = 1;
    // } else {
    //   rowsize2 = length.isEven && rowsize2.isEven ? rowsize2 : rowsize2 + 1;
    // }
    // var f = length;
    // for (int i = 0; i < f; i++) {
    //   gridist2.add(GridCard());
    // }