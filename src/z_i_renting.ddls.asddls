@AbapCatalog.sqlViewName: 'ZV_RENTL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Renting'
@Metadata.allowExtensions: true
define view Z_I_RENTING
  as select from Z_B_CARS as Cars
  association [1]    to Z_B_REM_DAYS     as _RemDays     on Cars.Matricula = _RemDays.Matricula
  association [0..*] to Z_B_BRANDS       as _Brands      on Cars.Marca = _Brands.Marca
  association [0..*] to Z_B_DET_CUSTOMER as _DetCustomer on Cars.Matricula = _DetCustomer.Matricula
{
  key Matricula,
      Marca,
      Modelo,
      Color,
      Motor,
      Potencia,
      Unidad,
      Combustible,
      Consumo,
      FechaFabricacion,
      Puertas,
      Precio,
      Moneda,
      Alquilado,
      Desde,
      Hasta,
      // 0 neutral grey
      // 1 negative red
      // 2 critical yellow
      // 3 positive green
      case
      when _RemDays.Dias <= 0 then 0
      when _RemDays.Dias between 1 and 60 then 1
      when _RemDays.Dias between 61 and 200 then 2
      when _RemDays.Dias > 200 then 3
      else 0
      end as TiempoRenta,
      ''  as Estado,
      _Brands.Imagen,
      
      _DetCustomer
}
