import 'package:flutter/material.dart';
import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:microblog/screens/MainScreen.dart';

showEditarPost(BuildContext context, NovidadeBoticario mPost,Function() sucesso){
        showDialog(
        context: context,
        
        barrierDismissible: true,
        builder: (BuildContext _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     ItemManterPost(mPost: mPost,),
                      
                  ],
                ),
            ),
          );
        });
  }