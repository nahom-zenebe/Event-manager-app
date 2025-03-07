import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/Event/data/datasource/eventdatasource.dart';
import 'package:myapp/features/Event/data/repository/eventRepositoryImpl.dart';
import 'package:myapp/features/Event/domain/usecase/%20createEventusecase.dart';
import 'package:myapp/features/Event/domain/usecase/deleteEventusecase.dart';
import 'package:myapp/features/Event/domain/usecase/getallEventsusecase.dart';
import 'package:myapp/features/Event/domain/usecase/searchEventusecase.dart';
import 'package:myapp/features/Event/domain/usecase/updateEventusecase.dart';
import 'package:myapp/features/Event/presentation/bloc/event_bloc.dart';
import 'package:myapp/features/auth/data/datasource/user_datasource.dart';
import 'package:myapp/features/auth/data/repositories/User_Authrepositoryimpl.dart.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/signup_usecase.dart';
import 'package:myapp/features/auth/presentation/UI/loginpage.dart';
import 'package:myapp/features/auth/presentation/bloc/auth/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(create: (context)=>AuthBloc(loginUsecase: LoginUsecase(UserAuthrepositoryimpl(UserDatasource())), signupUsecase: SignupUsecase(UserAuthrepositoryimpl(UserDatasource())))),
          BlocProvider(create: (context)=>EventBloc(createEvent:Createeventusecase(EventRepositoryImpl(EventDataSource())), deleteEvent: Deleteeventusecase((EventRepositoryImpl(EventDataSource()))), updateEvent: Updateeventusecase((EventRepositoryImpl(EventDataSource()))), searchEvent: Searcheventusecase((EventRepositoryImpl(EventDataSource()))), getAllEvents:Getalleventsusecase((EventRepositoryImpl(EventDataSource())))))
        
      ] ,
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()));
  }
}
