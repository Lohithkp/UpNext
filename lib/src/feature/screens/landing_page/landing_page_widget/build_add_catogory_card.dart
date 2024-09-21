import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:up_next/src/widget/type_writer_widget.dart';

import '../../../../model/card_Item_model.dart';
import '../../../../util/animated_util.dart';
import '../../add_category_page/add_category_page.dart';

class AddCategoryCard extends StatefulWidget {
  final int position;
  final List<CardItemModel> cardsList;
  final AnimationController controller;
  AddCategoryCard(
      {Key? key,
      required this.position,
      required this.cardsList,
      required this.controller})
      : super(key: key);

  @override
  State<AddCategoryCard> createState() => _AddCategoryCardState();
}

class _AddCategoryCardState extends State<AddCategoryCard> {
  var appColors;
  @override
  void initState() {
    super.initState();
    appColors = AnimatedUtil.generateColorsnew(widget.cardsList.length);
  }

  @override
  Widget build(BuildContext context) {
    print("printing buil;d");
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.white.withOpacity(1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 270.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Text(
                  widget.cardsList[widget.position].cardTitle,
                  style: TextStyle(
                      color: appColors[widget.position],
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 110,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: TypewriterText(
                    text: widget.cardsList[widget.position].runningText,
                    style: TextStyle(
                        fontSize: 18.0, color: appColors[widget.position]),
                    speed: const Duration(milliseconds: 100),
                    color: appColors[widget.position],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                    CurvedAnimation(
                      parent: widget.controller,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: Hero(
                    tag: "addCategoryHero",
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColors[widget.position],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                              vertical: 14.0), // Increased padding
                          textStyle:
                              TextStyle(fontSize: 20.0), // Larger text size
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Curved corners
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AddCategoryPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Add Category",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
