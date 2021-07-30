import 'package:flutter/material.dart';
import 'package:intro_slider_demo/Modals/IntroSliderClass.dart';
import 'package:intro_slider_demo/language.dart';

import '../main.dart';

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> with SingleTickerProviderStateMixin{

  List<IntroSliderClass> tabs = [
    IntroSliderClass(image: "assets/IntroSlider/1.PNG", title: SCHEDULE_YOUR_TIME[LANGUAGE_TYPE], subTitle: SCHEDULE_YOUR_DATETIME_FOR_YOUR_BEAUTY_SESSION[LANGUAGE_TYPE]),
    IntroSliderClass(image: "assets/IntroSlider/2.PNG", title: SCHEDULE_YOUR_TIME[LANGUAGE_TYPE], subTitle: SCHEDULE_YOUR_DATETIME_FOR_YOUR_BEAUTY_SESSION[LANGUAGE_TYPE]),
    IntroSliderClass(image: "assets/IntroSlider/3.PNG", title: SCHEDULE_YOUR_TIME[LANGUAGE_TYPE], subTitle: SCHEDULE_YOUR_DATETIME_FOR_YOUR_BEAUTY_SESSION[LANGUAGE_TYPE]),
    IntroSliderClass(image: "assets/IntroSlider/2.PNG", title: SCHEDULE_YOUR_TIME[LANGUAGE_TYPE], subTitle: SCHEDULE_YOUR_DATETIME_FOR_YOUR_BEAUTY_SESSION[LANGUAGE_TYPE]),
  ];

  TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
              children: List.generate(tabs.length, (index) => sliderContent(index)),
            controller: tabController,
          ),
        ),
        bottom(),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  bottom(){
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              children: List.generate(tabs.length, (index) => indicator(index)),
            ),
          ),
          
          InkWell(
            onTap: (){
              if(currentIndex < tabs.length - 1) {
                tabController.animateTo(currentIndex + 1, duration: Duration(milliseconds: 700), curve: Curves.easeIn);
              }else{
                //move to another screen
              }
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
              decoration: BoxDecoration(
                color: PINK,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ct.semiboldText(
                text: "Next",
                size: 14,
                color: WHITE,
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  sliderContent(int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
              color: WHITE,
              child: Center(
                child: Image.asset(
                  tabs[index].image,
                  height: 450,
                  width: 300,
                ),
              ),
            ),
        ),
        SizedBox(
          height: 20,
        ),

        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ct.semiboldText(
                text: tabs[index].title,
                color: BLACK,
                size: 24,
              ),
              SizedBox(
                height: 10,
              ),
              ct.regularText(
                text: tabs[index].subTitle,
                color: GREY,
                size: 17,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  indicator(int index){
    return Container(
      height: 6,
      width: 40,
      margin: EdgeInsets.only(right: 15),
      color: currentIndex == index ? PINK : PINK.withOpacity(0.2),
    );
  }

}
