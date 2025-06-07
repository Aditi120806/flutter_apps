
import 'dart:developer';
import 'package:api_tutorial/getdevicedata.dart';
import 'package:api_tutorial/newdatapage';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(onPressed: getalldevicedata, 
            child: const Text("get all device data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
    Map<String, dynamic> data = await getsingledevicedatabyid();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewDataPage(data: [data]), // wrap in list for consistency
      ),
    );
  },
               child: const Text("get single device data")),
                const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
    List<dynamic> data = await getalldevicedatabyid();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewDataPage(data: data),
      ),
    );
  },
               child: const Text("get multiple device data by id")),
                const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: postdevicedata,
               child: const Text("post  device data")),
                const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: putdevicedata,
               child: const Text("update device data")),
               const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: deletedevicedata,
               child: const Text("delete device data")),
               const SizedBox(
              height: 20,
            ),

            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DeviceListPage()),
    );
  },
  child: const Text("View All Devices"),
),

           

               
          ],



        ),
        

      ),
      
    );
  }
}
void getalldevicedata() async{
  Uri url=Uri.parse("https://api.restful-api.dev/objects");
  http.Response response = await http.get(url);
  List <dynamic> jsonData= json.decode(response.body);

}
Future<List<dynamic>> getalldevicedatabyid() async {
  Uri url = Uri.parse("https://api.restful-api.dev/objects?id=3&id=5&id=10");
  http.Response response = await http.get(url);
  List<dynamic> jsonData = json.decode(response.body);
  return jsonData;
}

Future<Map<String, dynamic>> getsingledevicedatabyid() async {
  Uri url = Uri.parse("https://api.restful-api.dev/objects/7");
  http.Response response = await http.get(url);
  Map<String, dynamic> jsonData = json.decode(response.body);
  return jsonData;
}


void postdevicedata() async{
  Uri url=Uri.parse("https://api.restful-api.dev/objects");
  Map devicedata ={
    "name" : "realme",
    "data" : {
      "color":"yellow",
      "price" : 30.00,
    }
  };
  http.Response response = await http.post(
  url,
  body: json.encode(devicedata),
  headers: {
    "content-type":"application/json",
  },
  );
  log(response.body);
}

void putdevicedata() async
{ Uri url =Uri.parse("https://api.restful-api.dev/objects");
  Map devicedata ={
    "name" : "realme",
    "data" : {
      "color":"yellow",
      "price" : 60.00,
    }
  };
  http.Response response = await http.post(
  url,
  body: json.encode(devicedata),
  headers: {
    "content-type":"application/json",
  },
  );
  log(response.body);
  

}
void deletedevicedata() async {
  Uri url =Uri.parse("https://api.restful-api.dev/objects/6");
  http.Response response=await http.delete(url);
  log(response.body);

}
