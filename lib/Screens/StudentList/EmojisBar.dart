import 'package:cts_app/constants/images.dart';
import 'package:flutter/material.dart';

class EmojiBar extends StatefulWidget {
  final ValueChanged<int> onChanged;
  const EmojiBar({
    required this.onChanged,
    super.key,
  });

  @override
  State<EmojiBar> createState() => _EmojiBarState();
}

class _EmojiBarState extends State<EmojiBar> {
  int n = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: SizedBox(
            height: n == 1 ? 25 : 20,
            width: n == 1 ? 25 : 20,
            child: n == 1
                ? Image.asset(
                    Images.famous,
                  )
                : Image.asset(
                    Images.famous,
                    colorBlendMode: BlendMode.colorDodge,
                    color: Colors.white.withOpacity(0.5),
                  ),
          ),
          onTap: () {
            setState(() {
              n = 1;
            });
            widget.onChanged(n);
          },
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          child: SizedBox(
            height: n == 2 ? 25 : 20,
            width: n == 2 ? 25 : 20,
            child: n == 2
                ? Image.asset(
                    Images.happy,
                  )
                : Image.asset(
                    Images.happy,
                    colorBlendMode: BlendMode.colorDodge,
                    color: Colors.white.withOpacity(0.5),
                  ),
          ),
          onTap: () {
            setState(() {
              n = 2;
            });
            widget.onChanged(n);
          },
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          child: SizedBox(
            height: n == 3 ? 25 : 20,
            width: n == 3 ? 25 : 20,
            child: n == 3
                ? Image.asset(
                    Images.sweating,
                  )
                : Image.asset(
                    Images.sweating,
                    colorBlendMode: BlendMode.colorDodge,
                    color: Colors.white.withOpacity(0.5),
                  ),
          ),
          onTap: () {
            setState(() {
              n = 3;
            });
            widget.onChanged(n);
          },
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: (() {
            setState(() {
              n = 4;
            });
            widget.onChanged(n);
          }),
          child: SizedBox(
            height: n == 4 ? 25 : 20,
            width: n == 4 ? 25 : 20,
            child: n == 4
                ? Image.asset(
                    Images.crying,
                  )
                : Image.asset(
                    Images.crying,
                    colorBlendMode: BlendMode.colorDodge,
                    color: Colors.white.withOpacity(0.5),
                  ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          child: SizedBox(
            height: n == 5 ? 25 : 20,
            width: n == 5 ? 25 : 20,
            child: n == 5
                ? Image.asset(
                    Images.angry,
                  )
                : Image.asset(
                    Images.angry,
                    colorBlendMode: BlendMode.colorDodge,
                    color: Colors.white.withOpacity(0.5),
                  ),
          ),
          onTap: () {
            setState(() {
              n = 5;
            });
            widget.onChanged(n);
          },
        ),
        // IconButton(
        //     onPressed: () {}, icon: const ImageIcon(AssetImage(Images.happy))),
        // IconButton(
        //     onPressed: () {},
        //     icon: const ImageIcon(AssetImage(Images.sweating))),
        // IconButton(
        //     onPressed: () {}, icon: const ImageIcon(AssetImage(Images.crying))),
        // IconButton(
        //     onPressed: () {}, icon: const ImageIcon(AssetImage(Images.angry)))
      ],
    );
  }
}
