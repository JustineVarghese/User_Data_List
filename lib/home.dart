import 'package:appscrip_task/Details.dart';
import 'package:appscrip_task/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('User List',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: true,
        bottom: userProvider.hasFetchedData
            ? PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search users...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: userProvider.filterUsers,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  ),
                ),
              )
            : null,
      ),
      body: Center(
        child: userProvider.isLoading
            ? const CircularProgressIndicator()
            : userProvider.hasFetchedData
                ? RefreshIndicator(
                    onRefresh: userProvider.fetchUsers,
                    child: ListView.builder(
                      itemCount: userProvider.filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = userProvider.filteredUsers[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              child: Text(user.name[0],
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            title: Text(user.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            subtitle: Text(user.email,
                                style: const TextStyle(color: Colors.grey)),
                                onTap: () {
                                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen(user: user),
                                ),
                              );
                                },
                          ),
                        );
                      },
                    ),
                  )
                : ElevatedButton(
                    onPressed: userProvider.fetchUsers,
                    child: const Text('Click here',style: TextStyle(fontSize: 24,),),
                  ),
      ),
      floatingActionButton: userProvider.hasFetchedData
          ? FloatingActionButton(
              onPressed: userProvider.fetchUsers,
              child: Icon(Icons.refresh),
            )
          : null,
    );
  }
}
