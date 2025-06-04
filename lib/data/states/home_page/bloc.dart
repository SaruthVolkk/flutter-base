import 'package:checkin_app/data/states/home_page/event.dart';
import 'package:checkin_app/data/states/home_page/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {}
}
