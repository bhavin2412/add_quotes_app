import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utility/DB/db_helper_quote.dart';
import '../../utility/constant/color.dart';
import '../../utility/constant/string.dart';
import '../controller/home_controller.dart';

class MotivationPage extends StatefulWidget {
  const MotivationPage({Key? key}) : super(key: key);

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMotivattionData();
  }

  void getMotivattionData() async {
    homeController.motivation_data.value =
        await DbHelperQuote.dbHelperQuote.readMotivationViewData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${StringData.motivatino_view_appbar_text}"),
          centerTitle: true,
          backgroundColor: ColorStyle.black,
        ),
        body:
        Obx(()=>
        ListView.builder(
          itemCount: homeController.motivation_data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width/0.5,
                          child: Text(
                              "${homeController.motivation_data[index]['quote_name']}"),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/0.5,
                          alignment: Alignment.centerRight,
                          child: Text(
                            "~ ${homeController.motivation_data[index]['author_name']}",
                            style: GoogleFonts.acme(),
                          ),
                        ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [],),
                      ],
                    ),
                  ),
                ),
              ),
            );

            // ListTile(title: Text("${homeController.motivation_data[index]['quote_name']}"),);
          },
        ),),
      ),
    );
  }
}
