@AbapCatalog.sqlViewName: 'ZV_DET_CUSTL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Details Customers'
@Metadata.allowExtensions: true
define view Z_B_DET_CUSTOMER
  as select from zrent_customers
{

  key doc_id    as ID,
  key matricula as Matricula,
      nombres   as Nombre,
      apellidos as Apellidos,
      email     as Correo,
      cntr_type as TipoContrato
}
