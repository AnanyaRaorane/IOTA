// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final _meetlink = Uri.parse('https://meet.google.com/seg-qafu-yps');

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: CupertinoColors.systemPink,
          child: Column(
            children: [
              Text(
                'DRAWER',
                style: TextStyle(color: CupertinoColors.white, fontSize: 30),
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.black87,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'LoanKr',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: CupertinoColors.systemPink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  cursorColor: CupertinoColors.systemPink,
                  autofillHints: Characters(AutofillHints.name),
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    icon: Icon(
                      Icons.man,
                      color: CupertinoColors.systemPink,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: mobileController,
                  cursorColor: CupertinoColors.systemPink,
                  autofillHints: Characters(AutofillHints.telephoneNumber),
                  decoration: InputDecoration(
                    hintText: 'Mobile No',
                    icon: Icon(
                      Icons.phone,
                      color: CupertinoColors.systemPink,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: CupertinoColors.systemPink,
                  autofillHints: Characters(AutofillHints.name),
                  decoration: InputDecoration(
                    hintText: 'Email id',
                    icon: Icon(
                      Icons.email,
                      color: CupertinoColors.systemPink,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Upload Aadhaar Card'), Icon(Icons.add)],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Upload Pan Card'), Icon(Icons.add)],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Upload Light Bill'), Icon(Icons.add)],
                    ),
                  ),
                ),

                ElevatedButton(onPressed: _launchUrl, child: Text('Meet'),),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print(nameController.text);
              print(mobileController.text);
              print(emailController.text);
            },


            child: Icon(Icons.add),
            backgroundColor: CupertinoColors.systemPink,
            )
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_meetlink,mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_meetlink';
  }
}