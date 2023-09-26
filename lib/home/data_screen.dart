import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/status/form_status.dart';
import '../provider/user_provider.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Data",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserProvider>(
            builder: (context, provider, child) {
              switch (provider.status) {
                case FormStatus.pure:
                  return Center(
                    child: Column(
                      children: [
                        const Text("Hozircha Data yo'q!"),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<UserProvider>(context, listen: false)
                                .fetchUsersData();
                          },
                          child: const Text("Data"),
                        ),
                      ],
                    ),
                  );
                case FormStatus.success:
                  return Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(
                          provider.users!.length,
                          (index) {
                            return ListTile(
                              leading: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    provider.users![index].id.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              title: Text(
                                provider.users![index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                case FormStatus.failure:
                  return Center(child: Text(provider.errorText));
                case FormStatus.loading:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
