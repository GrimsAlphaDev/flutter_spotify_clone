import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:flutter_spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:flutter_spotify_clone/core/configs/theme/app_colors.dart';
import 'package:flutter_spotify_clone/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  final bool initialIsFavorite;

  FavoriteButton(
      {required this.songEntity,
      this.function,
      bool? initialIsFavorite,
      super.key})
      : initialIsFavorite = initialIsFavorite ?? songEntity.isFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          // Gunakan state atau initialIsFavorite
          final isFavorite = state is FavoriteButtonUpdated
              ? state.isFavorite
              : initialIsFavorite;

          return IconButton(
            onPressed: () async {
              await context
                  .read<FavoriteButtonCubit>()
                  .favoriteButtonUpdated(songEntity.songId);
              if (function != null) {
                function!();
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
              size: 25,
              color: AppColors.darkGrey,
            ),
          );
        },
      ),
    );
  }
}
