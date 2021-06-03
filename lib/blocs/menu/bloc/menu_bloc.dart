import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatapp/models/MenuModel.dart';
import 'package:chatapp/repository/MenuRes.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial());

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is MenuLoad) {
      yield MenuLoading();
      try {
        List<MenuModel> result = await MenuRes().getMenu();
        yield MenuLoaded(menu: result);
      } catch (e) {
        yield MenuLoadError();
      }
    }
  }

}
