import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          leadingWidth: 50,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage('assets/profile_img.jpeg'),
            ),
          ),
          title: Text('My Tasks'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
        body:
            // TodoTitleWidget(),
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return const TodoTitleWidget();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 10,
          ),
        ));
  }
}

class TodoTitleWidget extends StatelessWidget {
  const TodoTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListTile(
          leading: Icon(
            Icons.check_circle_outline,
            size: 30,
          ),
          title: Text(
            'Plan a trip to Afadjato',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
          ),
          subtitle: Text('relaxing atmosphere for your family'),
          trailing: TextButton.icon(
              onPressed: null,
              icon: Icon(Icons.notifications),
              label: Text('Yesterday')),
        ),
      ),
    );
  }
}
