import 'package:api_practice/api/users_api.dart';
import 'package:api_practice/models/UsersModel.dart';
import 'package:api_practice/repositry/users_repositry.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    userApiService.list = repo.fetchData();
    super.initState();
  }

  //late Future<List<UsersModel>> future;
  final userApiService = UserApiService();
  final repo = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UsersModel>>(
        future: userApiService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      snapshot.data![index].name.toString(),
                    ),
                    Text(
                      snapshot.data![index].address!.city.toString(),
                    ),
                    Text(
                      snapshot.data![index].address!.geo!.lat!.toString(),
                    ),
                  ],
                );
              },
            );
          } else {
            return Text('No Data');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            userApiService.list = repo.fetchData();
          });
        },
      ),
    );
  }
}
