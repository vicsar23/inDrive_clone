import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
GalleryOrPhotoDialog(BuildContext context, Function() pickImage, Function() takePhoto) {

  return showDialog(
    context: context, 
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        'Selecciona una opcion',
        style: TextStyle(
          fontSize: 17
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            pickImage();
          }, 
          child: Text(
            'Galeria',
            style: TextStyle(
              color: Colors.black
            ),
          )
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            takePhoto();
          }, 
          child: Text(
            'Camara',
            style: TextStyle(
              color: Colors.black
            ),
          )
        ),
      ],
    )
  );

}