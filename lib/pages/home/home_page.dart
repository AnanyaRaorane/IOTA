import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:iota/model/device_model.dart';
import 'package:iota/pages/home/widgets/devices.dart';
import 'package:iota/utils/string_to_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState(){
    AlanVoice.addButton(
        "12dfa922dbb73367c7df51e057309bbb2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
    //AlanVoice.playText("Hi" );
  }
  List<DeviceModel> devices = [
    DeviceModel(
      name: 'A',
      isActive: true,
      color: "#ff5f5f",
    ),
    DeviceModel(
      name: 'B',
      isActive: true,
      color: "#7739ff",
    ),
    DeviceModel(
      name: 'C',
      isActive: false,
      color: "#c9c306",
    ),
    DeviceModel(
      name: 'D',
      isActive: false,
      color: "#c207db",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {  },

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color.fromARGB(87, 252, 226, 225), Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hi, Kuldeep",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                        minRadius: 16,
                        backgroundImage: AssetImage("assets/images/user.webp"))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "A total of 4 devices",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Are Connected",
                                    style: TextStyle(
                                        height: 1.1,
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.grey[300],
                                size: 30,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GridView.builder(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 4,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: devices.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Devices(
                                    name: devices[index].name,
                                    svg: devices[index].icon,
                                    color: devices[index].color.toColor(),
                                    isActive: devices[index].isActive,
                                    onChanged: (val) {
                                      setState(() {
                                        devices[index].isActive =
                                            !devices[index].isActive;
                                      });
                                    },
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
