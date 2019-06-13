import 'package:flutter/material.dart';

import 'package:ultracycling/src/pages/favorita_page.dart';
import 'package:ultracycling/src/pages/rutas.dart';
import 'package:ultracycling/src/pages/home_page.dart';
import 'package:ultracycling/src/pages/nueva_page.dart';
import 'package:ultracycling/src/pages/configuracion_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      '/'      : ( BuildContext context ) => HomePage(),
      'favorita'  : ( BuildContext context ) => FavoritaPage(),
      'rutas' : ( BuildContext context ) => RutasPage(),
      'nueva'   : ( BuildContext context ) => NuevaPage(),      
      'configuracion'   : ( BuildContext context ) => ConfiguracionPage()
  };

}
