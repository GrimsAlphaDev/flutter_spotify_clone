import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/get_user.dart';
import 'package:flutter_spotify_clone/presentation/profile/bloc/profile_info_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await serviceLocator<GetUserUseCase>().call();

    user.fold((ifLeft) {
      emit(ProfileInfoFailure());
    }, (ifRight) {
      emit(ProfileInfoLoaded(userEntity: ifRight));
    });
  }
}
