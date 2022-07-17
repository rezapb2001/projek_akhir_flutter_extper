library tv_series;


export 'domain/entities/tv.dart';
export 'domain/entities/tv_detail.dart';
export 'domain/repositories/tv_repository.dart';
export 'domain/usecases/get_detail_tv.dart';
export 'domain/usecases/get_now_playing_tv.dart';
export 'domain/usecases/get_popular_tv.dart';
export 'domain/usecases/get_recomendation_tv.dart';
export 'domain/usecases/get_top_rated_tv.dart';
export 'presentation/pages/home_tv_page.dart';
export 'presentation/pages/popular_tv_page.dart';
export 'presentation/pages/top_rated_tv_page.dart';
export 'presentation/pages/tv_detail_page.dart';
export 'presentation/widgets/tv_card_list.dart';
export 'presentation/bloc/tv_detail/tv_detail_bloc.dart';
export 'presentation/bloc/tv_now_playing/tv_now_playing_bloc.dart';
export 'presentation/bloc/tv_popular/tv_popular_bloc.dart';
export 'presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
export 'presentation/bloc/tv_top_rated/tv_top_rated_bloc.dart';
