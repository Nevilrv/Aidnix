import 'package:aidnix/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchLabListingScreen extends StatefulWidget {
  const SearchLabListingScreen({super.key});

  @override
  State<SearchLabListingScreen> createState() => _SearchLabListingScreenState();
}

class _SearchLabListingScreenState extends State<SearchLabListingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    TextEditingController search = TextEditingController(text: 'Green');

    var bottomItems = [
      {
        "title": "Home",
        "icon": "assets/icons/icon_home.svg",
      },
      {
        "title": "Test",
        "icon": "assets/icons/icon_microscope-fill.svg",
      },
      {
        "title": "Check Ups",
        "icon": "assets/icons/iocn_clipboard.svg",
      },
      {
        "title": "Profile",
        "icon": "assets/icons/icon_profile.svg",
      },
    ];

    int selected = 0;

    print("${width}");
    return Scaffold(
      bottomNavigationBar: Container(
        height: width > 800 ? width * 0.095 : width * 0.11,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.032, vertical: height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              bottomItems.length,
              (index) => GestureDetector(
                    onTap: () {
                      selected = index;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(bottomItems[index]['icon']!,
                            height: 28,
                            color: selected == index
                                ? kPrimary
                                : Color(0xffCDCDCD)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          bottomItems[index]['title']!,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Poppins",
                            color: selected == index
                                ? kPrimary
                                : Color(0xffCDCDCD),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.025),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),

              /// header
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: kGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/icons/icon_location.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "New York, USA",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                              color: kBlack,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/icons/icon_arrow_down.svg"),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/icon_notification.svg"),
                  const SizedBox(
                    width: 12,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset("assets/icons/icon_cart.svg"),
                      Positioned(
                        top: -5,
                        right: -5,
                        child: CircleAvatar(
                          backgroundColor: kYellow,
                          radius: 8,
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Poppins",
                              color: kWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),

              ///search bar
              SizedBox(
                height: height * 0.026,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height * 0.06,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: kLightGrey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/icon_search.svg"),
                          const SizedBox(
                            width: 6,
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: width < 700 ? 8.0 : 0),
                              child: TextField(
                                cursorColor: kPrimary,
                                controller: search,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  color: kGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: height * 0.06,
                    width: height * 0.06,
                    decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: kPrimary.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 15))
                        ]),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/icon_filter.svg"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.012,
              ),

              ///filter items
              Row(
                children: [
                  Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: kLightGrey1,
                          borderRadius: BorderRadius.circular(
                            15,
                          )),
                      child: Row(
                        children: [
                          Text(
                            'Labs',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              color: kDarkGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset("assets/icons/icon_close.svg")
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: kLightGrey1,
                        borderRadius: BorderRadius.circular(
                          15,
                        )),
                    child: Row(
                      children: [
                        Text(
                          'Blood',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            color: kDarkGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset("assets/icons/icon_close.svg")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Great! Please select the lab which suits you best',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  color: kDarkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: kBlack.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: ClipRRect(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(height * 0.018),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0xffE7EFF1),
                                        radius: height * 0.04,
                                        child: Image.asset(
                                          "assets/icons/image_lab_profile.png",
                                          fit: BoxFit.cover,
                                          height: height * 0.045,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -3,
                                        right: -3,
                                        child: SvgPicture.asset(
                                          "assets/icons/icon_verify.svg",
                                          height: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Greenlab Biotech',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Poppins",
                                          color: kBlack,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: kPrimary.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            )),
                                        child: Center(
                                          child: Text(
                                            '20%',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: "Poppins",
                                              color: kPrimary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/icon_star.svg",
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '5.0',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Poppins",
                                          color: kBlack,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '(1.1k Rating)',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                          color: kBlack,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/icon_microscope-fill.svg",
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '100+ Tests',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Poppins",
                                          color: kBlack,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/icon_medical.svg",
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        color: kDarkGrey1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/icon_location_2.svg",
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '2 Km from you',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        color: kDarkGrey1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/icon_blood_test.svg",
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Blood Test',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      color: kDarkGrey1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    decoration: BoxDecoration(
                                        color: kPrimary,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: Text(
                                        'Add To Cart:₹1200',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Poppins",
                                          color: kWhite,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 25,
                          right: -45,
                          child: Transform.rotate(
                            angle: 0.8,
                            child: Container(
                              height: 25,
                              width: 150,
                              color: kRed,
                              child: Center(
                                child: Text(
                                  '20% OFF',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Poppins",
                                    color: kWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
