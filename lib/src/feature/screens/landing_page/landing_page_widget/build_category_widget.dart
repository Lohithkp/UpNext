import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:up_next/src/widget/type_writer_widget.dart';

import '../../../../model/card_Item_model.dart';
import '../../../../util/animated_util.dart';

class BuildCategoryCard extends StatefulWidget {
  final int position;
  final List<CardItemModel> cardsList;
  final AnimationController controller;
  BuildCategoryCard(
      {Key? key,
      required this.position,
      required this.cardsList,
      required this.controller})
      : super(key: key);

  @override
  State<BuildCategoryCard> createState() => _BuildCategoryCardCardState();
}

class _BuildCategoryCardCardState extends State<BuildCategoryCard> {
  var appColors;
  @override
  void initState() {
    super.initState();
    appColors = AnimatedUtil.generateColorsnew(widget.cardsList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.white.withOpacity(1.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
          width: 250.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(widget.cardsList[widget.position].icon,
                        color: appColors[widget.position]),
                    const Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: TypewriterText(
                  text: widget.cardsList[widget.position].runningText,
                  style: TextStyle(
                      fontSize: 18.0, color: appColors[widget.position]),
                  speed: const Duration(milliseconds: 100),
                  color: appColors[widget.position],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        "${widget.cardsList[widget.position].tasksRemaining} Tasks",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        widget.cardsList[widget.position].cardTitle,
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        value: widget.cardsList[widget.position].taskCompletion,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
