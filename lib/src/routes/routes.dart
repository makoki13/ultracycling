import 'package:flutter/material.dart';

import 'package:ultracycling/src/pages/ruta_page.dart';
import 'package:ultracycling/src/pages/nueva_jornada_page.dart';
import 'package:ultracycling/src/pages/rutas_page.dart';
import 'package:ultracycling/src/pages/home_page.dart';
import 'package:ultracycling/src/pages/nueva_ruta_page.dart';
import 'package:ultracycling/src/pages/configuracion_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      '/'      : ( BuildContext context ) => HomePage(),
      'favorita'  : ( BuildContext context ) => RutaPage(),
      'rutas' : ( BuildContext context ) => RutasPage(),
      'nueva'   : ( BuildContext context ) => NuevaRutaPage(),      
      'configuracion'   : ( BuildContext context ) => ConfiguracionPage(),
      'nueva_jornada'   : ( BuildContext context ) => NuevaJornadaPage(),      
  };

}
