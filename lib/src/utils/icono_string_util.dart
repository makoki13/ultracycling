import 'package:flutter/material.dart';

final _icons = <String, IconData>{

  'favorita'      : Icons.favorite,
  'bicicleta'     : Icons.directions_bike,
  'folder_open'   : Icons.create_new_folder,
  'config'        : Icons.settings_applications,
  '0'             : Icons.ondemand_video,
  '1'             : Icons.directions_bike,
  '2'             : Icons.stop,
  '3'             : Icons.not_interested,
  ''              : Icons.blur_off
};




Icon getIcon( String nombreIcono ) {

  return Icon( _icons[nombreIcono], color: Colors.redAccent );
  
}