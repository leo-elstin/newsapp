import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/home/news_details.dart';
import 'package:newsapp/view_model/home/news_cubit.dart';

import '../../model/data_model/news_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          const CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: context.read<NewsCubit>().articles.length,
          itemBuilder: (BuildContext context, int index) {
            Article? articles = context.read<NewsCubit>().articles[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetails(
                            details: articles,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage('${articles.urlToImage}'),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text('${articles.title}'),
                        ),
                        const Icon(Icons.more_vert),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
