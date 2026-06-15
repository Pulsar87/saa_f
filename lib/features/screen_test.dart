import 'package:flutter/material.dart';

class ScreenTest extends StatelessWidget {
  const ScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Theme test screen"),
          // leading: Icon(
          //   Icons.list,
          // ),
          actions: [
            Icon(Icons.account_circle_rounded)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon (Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon (Icons.archive), label: "hi"),
            BottomNavigationBarItem(icon: Icon (Icons.archive), label: "hi"),
            BottomNavigationBarItem(icon: Icon (Icons.archive), label: "hi"),
            BottomNavigationBarItem(icon: Icon (Icons.archive), label: "hi"),
            BottomNavigationBarItem(icon: Icon (Icons.archive), label: "hi"),
          ],
          currentIndex: 0,


        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        body: Container(
          width: double.infinity,
          child: Column(

            children: [
              TabBar(
                tabs : [
                  Tab(child: Text('Test',maxLines: 1,),),
                  Tab(child: Text('Test',maxLines: 1,),),
                  Tab(child: Icon(Icons.picture_as_pdf)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [

                    Column(
                      children: [
                        Text(
                            "title Large",
                            style: Theme.of(context).textTheme.titleLarge

                        ),
                        Divider(),
                        Text(
                            "title Medium , This style is the style of text inside textField",
                            style: Theme.of(context).textTheme.titleMedium

                        ),
                        Divider(),
                        Text(
                            "- body small body small body small body small body small body small body small ",
                            style: Theme.of(context).textTheme.bodySmall

                        ),
                        Divider(),
                        Text(
                            " labelMedium ",
                            style: Theme.of(context).textTheme.labelMedium

                        ),
                        Divider(),
                        Text(
                            " titleSmall ",
                            style: Theme.of(context).textTheme.titleSmall

                        ),
                        Divider(),

                        Icon(Icons.star)

                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      child: Center(
                        child:  TextFormField(
                          maxLines: 4,
                          minLines: 1,
                          maxLength: 50,
                          decoration: InputDecoration(
                              hintText: 'Write Something...',
                              label: Text ("This is test"),
                              suffixIcon:Icon( Icons.hail),
                              prefixIcon: Icon(Icons.add_call)
                          ),
                        ),
                      ),
                    ),

                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
