import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';

class MenuCardW extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final String title;
  final String subtitle;
  final double? angle;
  final double? imgWidth;
  final double? scale;
  final String letra;

  const MenuCardW({super.key, required this.color, required this.imageUrl, required this.title, required this.subtitle, this.angle, this.imgWidth, this.scale, required this.letra});

  


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            width: size.width * 1,
            height: 180,
            /* decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 1.0),
            ), */
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 30,
                  child: Container(
                    width: 310,
                    height: 120,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: color,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: Colors.white70, style: BorderStyle.solid, width: 1.0),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 20),
                            width: 120,
                            child: Text(
                              title,
                              style: AppTheme.captionTitleMenu,
                            ),
                          ),
                          if(subtitle!='')Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(100),
                              borderRadius: BorderRadius.circular(7)
                            ),
                            margin: const EdgeInsets.only(left: 20,top: 10),
                            padding: const EdgeInsets.only(left: 10),
                            width: 120,
                            height: 30,
                            //constraints: BoxConstraints.tight(Size.fromHeight(60)),
                            child: Row(
                              
                              children: [
                                Text(
                                  subtitle,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.primary1
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.menu_book_sharp,color: AppTheme.primary1,),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 195,
                  child: Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                          angle: angle ?? 0,
                          child: Container(
                              alignment: Alignment.center,
                              width: imgWidth??180,
                              child: Image.asset(
                                imageUrl,
                                scale: scale,
                              ),))),
                ),
                Positioned(
                  top: 65,
                  left: 10,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 3,
                          spreadRadius: 0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(220),
                    ),
                    child: Center(child: Text(letra,style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),)),
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
