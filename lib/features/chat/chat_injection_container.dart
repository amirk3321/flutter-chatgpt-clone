



import 'package:flutter_chatgpt_clone/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:flutter_chatgpt_clone/features/chat/data/remote_data_source/chat_remote_data_source_impl.dart';
import 'package:flutter_chatgpt_clone/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/usecases/chat_converstaion_usecase.dart';
import 'package:flutter_chatgpt_clone/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:flutter_chatgpt_clone/injection_container.dart';

Future<void> chatInjectionContainer() async  {


  sl.registerFactory<ChatConversationCubit>(
        () => ChatConversationCubit(
      chatConversationUseCase: sl.call(),
    ),
  );


  ///useCases
  sl.registerLazySingleton<ChatConversationUseCase>(
          () => ChatConversationUseCase(repository: sl.call()));

  ///Repository
  sl.registerLazySingleton<ChatRepository>(
          () => ChatRepositoryImpl(remoteDataSource: sl.call()));


  ///remote data source
  sl.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(httpClient: sl.call()),
  );
}
