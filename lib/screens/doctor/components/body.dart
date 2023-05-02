import 'package:flutter/material.dart';
import 'package:HealTech/screens/doctor/doctor_screen.dart';
import 'package:HealTech/screens/details_page/details_page.dart';
import 'package:HealTech/screens/doctor/models/doctor_model.dart';

import 'doctor_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          TextField(
            onChanged: (value) => DoctorList.updateList(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                hintText: "Search for doctor",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.align_horizontal_right),
                prefixIconColor: Colors.grey.shade300,
                suffixIconColor: Colors.grey.shade300),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<void>(
            future: DoctorList.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('An error occurred while loading data'));
              } else {
                DoctorList
                    .initializeList(); // Update the displayList based on the doctorList
                return Expanded(
                  child: DoctorList.displayList.length == 0
                      ? Center(
                          child: Text('No results found',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)))
                      : ListView.builder(
                          itemCount: DoctorList.displayList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Handle the click event here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoctorDetailPage(
                                          doctor:
                                              DoctorList.displayList[index])),
                                );
                              },
                              child: Container(
                                width: 350,
                                height: 120,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 2,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(8.0),
                                    leading: Image.network(
                                      DoctorList.displayList[index]
                                              .docotorImage ??
                                          'https://via.placeholder.com/150',
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Image.network(
                                              'https://via.placeholder.com/150'),
                                      height:
                                          100, // change this value to adjust the height of the image
                                      width:
                                          40, // change this value to adjust the width of the image
                                    ),
                                    title: Text(
                                      DoctorList.displayList[index].doctorName!,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              size: 16.0,
                                              color: Colors.grey[600],
                                            ),
                                            SizedBox(width: 5.0),
                                            Text(
                                              '${DoctorList.displayList[index].doctorHospital!}',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                            color: Colors.red[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            '${DoctorList.displayList[index].doctorSpeciality!}',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
