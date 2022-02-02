import 'package:flutter/material.dart';
import 'package:house_ui/custom/borderbox.dart';
import 'package:house_ui/custom/button.dart';
import 'package:house_ui/utils/constants.dart';
import 'package:house_ui/utils/custom_functions.dart';
import 'package:house_ui/utils/sample_data.dart';
import 'package:house_ui/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    const double padding = 25;
    final ThemeData themeData = Theme.of(context);
    const side = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: s.width,
              height: s.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: side,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BordarBox(
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                          padding: EdgeInsets.all(8),
                          width: 50,
                          height: 50,
                        ),
                        BordarBox(
                          child: Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                          padding: EdgeInsets.all(8),
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: side,
                    child: Text('City', style: themeData.textTheme.bodyText2),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: side,
                    child: Text('San Francico',
                        style: themeData.textTheme.headline1),
                  ),
                  addVerticalSpace(padding),
                  const Padding(
                    padding: side,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(padding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: const [
                      ChoiceOption(text: '<\$220,000'),
                      ChoiceOption(text: 'For Sale'),
                      ChoiceOption(text: '3-4 Beds'),
                      ChoiceOption(text: '>1000 sqft')
                    ]),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: side,
                      child: ListView.builder(
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstate(itemdata: RE_DATA[index]);
                          }),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                width: s.width,
                child: Center(
                  child: OptionButton(
                    icon: Icons.map_rounded,
                    text: 'Map View',
                    width: s.width * 0.40,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  const ChoiceOption({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    final ThemeData tt = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: tt.textTheme.headline5,
      ),
    );
  }
}

class RealEstate extends StatelessWidget {
  const RealEstate({Key? key, required this.itemdata}) : super(key: key);
  final dynamic itemdata;
  @override
  Widget build(BuildContext context) {
    final ThemeData tt = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(itemdata['image'])),
              const Positioned(
                top: 15,
                right: 15,
                child: BordarBox(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: COLOR_BLACK,
                    ),
                    padding: EdgeInsets.all(8),
                    width: 50,
                    height: 50),
              )
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                formatCurrency(itemdata['amount']),
                style: tt.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                itemdata['address'],
                style: tt.textTheme.bodyText2,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            '${itemdata['bedrooms']} bedrooms/ ${itemdata['bathrooms']} bathrooms/ ${itemdata['area']} sqft',
            style: tt.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
