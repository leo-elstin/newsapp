import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model/news_Service.dart';
import 'package:newsapp/view/home/news_list.dart';
import 'package:newsapp/view_model/home/news_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //NewsService().getNewsApi();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      NewsService().getNewsApi();
      context.read<NewsCubit>().getNewsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Icon(Icons.location_pin),
              Text(
                'G.T.Road, Kolkata',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                    Text('500',
                        style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Sports",
              ),
              Tab(
                text: "All",
              ),
              Tab(
                text: "Politics",
              ),
              Tab(
                text: "Health",
              ),
            ],
          ),
        ),
        body: const NewsList(),
      ),
    );
  }
}
