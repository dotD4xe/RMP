import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/nasa_cubit.dart';
import '../data/requests/api.dart';

class NasaScreen extends StatelessWidget {
  const NasaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NasaCubit(ApiService())..loadPhotos(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Photo Mars"),
          centerTitle: true,
        ),
        body: BlocBuilder<NasaCubit, NasaState>(
          builder: (context, state) {
            if (state is NasaLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NasaLoadedState) {
              final photos = state.photos;
              return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            child: Image.network(
                              photo.imgSrc ?? '',
                              width: 200,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    photo.rover?.name ?? 'Unknown',
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is NasaErrorState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
