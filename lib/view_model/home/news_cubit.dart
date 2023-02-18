import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/model/data_model/news_model.dart';
import 'package:newsapp/model/news_Service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final _service = NewsService();
  List<Article> articles = [];

  Future<NewsModel?> getNewsList() async {
    emit(NewsLoading());
    NewsModel? model = await _service.getNewsApi();
    if (model != null) {
      articles = model!.articles!;
      emit(NewsLoaded());
    } else {
      emit(NewsLoadingFailed());
    }
  }
}
