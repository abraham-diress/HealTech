import 'package:flutter/material.dart';
import '../model/hospital_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   int _selectedIndex = 0;
  
  static List<HopsitalModel> hospitalList = [
    HopsitalModel("King Faisal Hospital", "Kimironko", "https://img.freepik.com/free-vector/medical-care_24877-49075.jpg?w=740&t=st=1681651744~exp=1681652344~hmac=baf2b996084888444fc0179f7eea46d2698cd7ac823498e59201f0c7ac80fe01"),
    HopsitalModel("Horebu Medical Clinic", "Remera", "https://img.freepik.com/free-vector/medical-care_24877-49075.jpg?w=740&t=st=1681651744~exp=1681652344~hmac=baf2b996084888444fc0179f7eea46d2698cd7ac823498e59201f0c7ac80fe01"),
    HopsitalModel("Military Medical Clinic", "Kacyiru", "https://img.freepik.com/free-vector/medical-care_24877-49075.jpg?w=740&t=st=1681651744~exp=1681652344~hmac=baf2b996084888444fc0179f7eea46d2698cd7ac823498e59201f0c7ac80fe01"),
    HopsitalModel("Kibagabaga Medical Hostel", "Kibagabaga", "https://img.freepik.com/free-vector/medical-care_24877-49075.jpg?w=740&t=st=1681651744~exp=1681652344~hmac=baf2b996084888444fc0179f7eea46d2698cd7ac823498e59201f0c7ac80fe01"),
    HopsitalModel("Polyfam Clinic", "Gissimenti", "https://img.freepik.com/free-vector/medical-care_24877-49075.jpg?w=740&t=st=1681651744~exp=1681652344~hmac=baf2b996084888444fc0179f7eea46d2698cd7ac823498e59201f0c7ac80fe01"),
    HopsitalModel("Group Medical", "Kanombe", "https://img.freepik.com/free-vector/medical-care_24877-49075.jpg?w=740&t=st=1681651744~exp=1681652344~hmac=baf2b996084888444fc0179f7eea46d2698cd7ac823498e59201f0c7ac80fe01"),
  ];

  List<HopsitalModel>displayList = List.from(hospitalList);
  void updateList(String value){
    setState(() {
      displayList = hospitalList.where((element) => element.hospitalName!.toLowerCase().contains(value.toLowerCase())).toList();
    });
     int _selectedIndex = 0;

  //void _onItemTapped(int index) {
    //setState(() {
     // _selectedIndex = index;
    //});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
      ),
       body:  
       Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0, 
              ),
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none
                  ),
                  hintText: "Find Hospital",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.align_horizontal_right),
                  prefixIconColor: Colors.grey.shade300,
                  suffixIconColor: Colors.grey.shade300

                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {},
                child: const Text("All"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent.shade700,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                  )
                )

              ),
             SizedBox(height: 20,),
Expanded(
  child: displayList.length == 0
    ? Center(child: Text('No results found', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
    : ListView.builder(
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle the click event here
              print('Card clicked!');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                contentPadding: EdgeInsets.all(8.0),
                leading: Image.network(
                  displayList[index].hospitalLogo ?? 'https://via.placeholder.com/150',
                  errorBuilder: (context, error, stackTrace) => Image.network('https://via.placeholder.com/150'),
                ),
                title: Text(
                  displayList[index].hospitalName!, 
                  style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 16.0,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '${displayList[index].hospitalLocation!}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
),


              
          ],
        ),
        
      
      ),
      bottomNavigationBar:BottomNavigationBar(
        iconSize: 40.0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.local_hospital),
        label: 'Hospital',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Doctors',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ],) ,
    );
    
  }
}