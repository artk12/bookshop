import 'package:book/components/searchfieldwithoutlable.dart';
import 'package:book/components/simpletext.dart';
import 'package:book/providers/dragController.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends PreferredSize {
  final HomeProvider homeProvider;
  final PageController pageController;
  final Animation<double> searchFieldAnimation;
  final FocusNode focusNode;
  final DragController drag;
  final Function searchIconPress;
  final Function backIconInSearchMode;
  final AnimationController animationController;
  final bool searchMode;

  HomeAppBar(
      {this.animationController,
      this.focusNode,
      this.homeProvider,
      this.pageController,
      this.drag,
      this.backIconInSearchMode,
      this.searchFieldAnimation,
      this.searchIconPress,
      this.searchMode});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: homeProvider.page == 2 ? Colors.transparent : null,
      backgroundColor: homeProvider.page == 2
          ? Colors.cyan
          : Color.fromARGB(255, 247, 247, 247),
      title: searchMode
          ? Container()
          : homeProvider.page == 3
              ? GestureDetector(
                  onTap: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    homeProvider.updatePage(2);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 14,
                        color: Color.fromARGB(255, 71, 71, 71),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SimpleText(
                        text: 'پروفایل',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 71, 71, 71),
                      )
                    ],
                  ),
                )
              : SimpleText(
                  text: homeProvider.page == 0
                      ? 'خانه'
                      : homeProvider.page == 1 ? 'علاقه مندی ها' : '',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: homeProvider.page == 2
                      ? Colors.white
                      : Color.fromARGB(255, 71, 71, 71),
                ),
      actions: [
        !searchMode
            ? Container()
            : ScaleTransition(
                scale: searchFieldAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: SearchFieldWithOutLabel(
                    focusNode: focusNode,
                    iconData: Icons.search,
                    onChange: (t) {},
                  ),
                ),
              ),
        homeProvider.page == 3
            ? Container()
            : homeProvider.page == 2
                ? IconButton(
                    onPressed: () {
                      drag.updateLeft(drag.left != 0.0 ? 0.0 : drag.maxDrag);
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  )
                : !searchMode
                    ? IconButton(
                        onPressed: searchIconPress,
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 71, 71, 71),
                        ),
                      )
                    : RotationTransition(
                        turns: Tween(begin: 0.0, end: 2.0)
                            .animate(animationController),
                        child: IconButton(
                          onPressed: backIconInSearchMode,
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 71, 71, 71),
                          ),
                        ),
                      )
      ],
    );
  }
}
