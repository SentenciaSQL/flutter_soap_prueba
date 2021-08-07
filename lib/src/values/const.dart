class Const {

  static String getConsultaCliente(String referencia, String tipoReferencia, String usuarioid, String clave, String cajaid) {
    return '''
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:obj="http://objetos_negocio.sgpe.edenorte.com/">
        <soapenv:Header/>
        <soapenv:Body>
            <obj:getConsultaCliente>
              <!--Optional:-->
              <referencia>$referencia</referencia>
              <tipo_referencia>$tipoReferencia</tipo_referencia>
              <!--Optional:-->
              <usuarioid>$usuarioid</usuarioid>
              <!--Optional:-->
              <clave>$clave</clave>
              <cajaid>$cajaid</cajaid>
            </obj:getConsultaCliente>
        </soapenv:Body>
      </soapenv:Envelope>
    ''';
  }

}