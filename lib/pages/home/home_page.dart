import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alan_voice/alan_voice.dart';
import 'package:iota/model/device_model.dart';
import 'package:iota/pages/home/widgets/devices.dart';
import 'package:iota/utils/string_to_color.dart';

const String blynkApiKey = 'your_api_key_here';

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
    AlanVoice.playText("Hi" );
  }
  List<DeviceModel> devices = [
    DeviceModel(
      name: 'A',
      isActive: false,
      color: "#ff5f5f",
      virtualPin: 'v1',
    ),
    DeviceModel(
      name: 'B',
      isActive: false,
      color: "#7739ff",
      virtualPin: 'v2',
    ),
    DeviceModel(
      name: 'C',
      isActive: false,
      color: "#c9c306",
      virtualPin: 'v3',
    ),
    DeviceModel(
      name: 'D',
      isActive: false,
      color: "#c207db",
      virtualPin: 'v4',
    ),
  ];
  Future<void> toggleDevice(DeviceModel device) async {
    final url = Uri.parse('https://lon1.blynk.cloud/external/api/update');
    final value = device.isActive ? '0' : '1';
    final response = await http.get(url.replace(queryParameters: {
      'token': 'y6NHcNnRfk8WX8VL5LFmnsY3rC122zLs',
      device.virtualPin: value,
    }));
    if (response.statusCode == 200) {
      setState(() {
        device.isActive = !device.isActive;
      });
      print("value updated");
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    //onChanged: toggleSwitch,
                                    onChanged: (val) {
                                      toggleDevice(devices[index]);
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

