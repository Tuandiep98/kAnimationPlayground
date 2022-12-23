part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  final CarouselController popularCarouselController;
  const TrendingState({required this.popularCarouselController});
  
  @override
  List<Object> get props => [];
}

class PopularLoaded extends TrendingState {
  
  const PopularLoaded({
    required popularCarouselController,
  }) : super(popularCarouselController: popularCarouselController);

  @override
  List<Object> get props => [popularCarouselController];
}