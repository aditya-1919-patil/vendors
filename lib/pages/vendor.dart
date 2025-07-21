import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vendors extends StatelessWidget {
  const Vendors({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vendors = [
      {
        "name": "ABC Vendors",
        "type": "ABC Wholes",
        "phone": "123-445-5667",
        "location": "Metropolis"
      },
      {
        "name": "XYZ Vendors",
        "type": "XYZ Retailers",
        "phone": "555-123-7890",
        "location": "Gotham"
      },
    ];


    TextEditingController searchcontroller = TextEditingController();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Vendors",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchcontroller,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.black, size: 30),
                suffixIcon: Icon(Icons.mic, color: Colors.grey, size: 30),
                helperStyle: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: CupertinoColors.activeBlue,
                foregroundColor: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Import Vendor",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vendors.length,
              itemBuilder: ( context, index) {
                final vendor = vendors[index];
                return  Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue[200],
                              child: Icon(Icons.store, color: Colors.blue),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vendor["name"]!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                   vendor ["type"]!,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(Icons.more_vert),
                              onSelected: (value) {},
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'edit ',
                                  child: Text('Edit Vendor'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'view',
                                  child: Text('View Vendor'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'product',
                                  child: Text('View Fix Peoduct'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'deactive',
                                  child: Text("Deactive Vendor"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(thickness: 1, color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone, color: Colors.green),
                                SizedBox(width: 8),
                                Text(vendor["phone"]!),
                              ],
                            ),
            
                            Row(
                              children: [
                                Icon(Icons.location_pin, color: Colors.red),
                                SizedBox(width: 8),
                                Text(vendor["location"]!),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        ],

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Colors.blue,
        child: Icon(CupertinoIcons.plus,color: Colors.white,),),

    );
  }
}
