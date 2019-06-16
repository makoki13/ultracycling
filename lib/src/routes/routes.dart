import 'package:flutter/material.dart';

import 'package:ultracycling/src/pages/rutas/jornada/jornada_page.dart';
import 'package:ultracycling/src/pages/rutas/ruta_page.dart';
import 'package:ultracycling/src/pages/rutas/nueva_jornada_page.dart';
import 'package:ultracycling/src/pages/rutas/rutas_page.dart';
import 'package:ultracycling/src/pages/home_page.dart';
import 'package:ultracycling/src/pages/nueva/nueva_ruta_page.dart';
import 'package:ultracycling/src/pages/configuracion/configuracion_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      '/'               : ( BuildContext context ) => HomePage(),
      'favorita'        : ( BuildContext context ) => RutaPage(),
      'rutas'           : ( BuildContext context ) => RutasPage(),
      'nueva'           : ( BuildContext context ) => NuevaRutaPage(),      
      'configuracion'   : ( BuildContext context ) => ConfiguracionPage(),
      'nueva_jornada'   : ( BuildContext context ) => NuevaJornadaPage(),      
      'jornada'         : ( BuildContext context ) => JornadaPage(),      
  };

}
