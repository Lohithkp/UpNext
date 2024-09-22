import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/card_Item_model.dart';
import '../../../util/animated_util.dart';
import '../../../util/catogory_list.dart';
import 'drawer_page/drawer_page.dart';
import 'landing_page_widget/build_add_catogory_card.dart';
import '../../../widget/type_writer_widget.dart';
import '../../../widget/welcome_widget.dart';
import 'landing_page_widget/build_category_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController scrollController;
  late List<Color> appColors;
  var cardIndex = 0;
  List<CardItemModel> cardsList = [];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);
    cardsList = CategoryList.getCardsList;
    // Start the animation
    appColors = AnimatedUtil.generateColorsnew(cardsList.length);
  }

  // Dispose of the AnimationController
  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller
    scrollController.dispose(); // Also dispose of the scroll controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MyDrawer(
        user: null,
      ),
      appBar: AppBar(
        backgroundColor: appColors[cardIndex],
        title: const Text(
          "Up Next",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: appColors[cardIndex],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const WelcomeWidget(),
            Expanded(
              child: CardList(
                cardsList: cardsList,
                appColors: appColors,
                animationController: _controller,
                scrollController: scrollController,
                onCardSwipe: (index) {
                  setState(() {
                    cardIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<CardItemModel> cardsList;
  final List<Color> appColors;
  final ScrollController scrollController;
  final AnimationController animationController;
  final Function(int) onCardSwipe;

  const CardList({
    Key? key,
    required this.cardsList,
    required this.appColors,
    required this.scrollController,
    required this.animationController,
    required this.onCardSwipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: cardsList.length,
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, position) {
        if (position == 0) {
          return AddCategoryCard(
            position: position,
            controller: animationController,
            cardsList: cardsList,
          );
        } else {
          return BuildCategoryCard(
            position: position,
            controller: animationController,
            cardsList: cardsList,
          );
        }
      },
    );
  }
}
