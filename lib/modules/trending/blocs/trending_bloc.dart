import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';

part 'trending_event.dart';
part 'trending_state.dart';

CarouselController popularCarouselController = CarouselController();

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc()
      : super(PopularLoaded(
            popularCarouselController: popularCarouselController)) {
    on<PopularStarted>((event, emit) {
      emit(PopularLoaded(popularCarouselController: popularCarouselController));
    });
  }
}
