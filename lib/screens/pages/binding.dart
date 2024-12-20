import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Binding extends StatefulWidget {
  const Binding({super.key});

  @override
  State<Binding> createState() => _BindingState();
}

class _BindingState extends State<Binding> {
  // Future method to fetch and parse data from a stream
  Future<dynamic> fetchData() async {
    try {
      // Use http.Client to send the request
      final client = http.Client();
      // final uri = Uri.parse("http://10.177.48.186:8080/DesignSpace/GetMasterDataController?par1=LiveStatus");
      final uri = Uri.parse(
          "http://10.177.48.186:8080/DesignSpace/API/Binding");
      final request = http.Request('GET', uri);
      final streamedResponse = await client.send(request);

      // Process the stream of the response
      final responseBody = await streamedResponse.stream
          .bytesToString(); // Convert the byte stream to string

      if (streamedResponse.statusCode == 200) {
        // Now decode the JSON response
        var data = json.decode(responseBody);

        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return {'Error': e.toString()}; // Return error message if the API fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Retry the request by calling setState
                  },
                  child: const Text('Retry'),
                )
              ],
            ),
          );
        } else if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          try {
            // If the data is a list, display it
            List<dynamic> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                String readyText =
                    "${data[index]["JobNo"]}   "
                    "${data[index]["PartyName"]}@${data[index]["prepared_by"]}#"
                    "${data[index]["JobCategory"]}#${data[index]["BindingCategory"]}#"
                    "${data[index]["JobTitle"]}";

                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 21, 43, 61), // Light background color
                    borderRadius: BorderRadius.circular(
                        14.0), // Rounded corners with a radius of 12.0
                  ),
                  margin: EdgeInsets.all(4.0), // Bottom margin
                  padding: EdgeInsets.all(8.0), // Padding inside the container
                  child: ListTile(
                    title: Text(readyText,
                    style: TextStyle(color: Colors.white)), // Display the list item
                  ),
                );
              },
            );
          } catch (e) {
            return const Center(child: Text('Unsupported data format'));
          }
        }
      },
    );
  }
}
