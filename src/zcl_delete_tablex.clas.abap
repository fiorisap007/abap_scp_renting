CLASS zcl_delete_tablex DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_delete_tablex IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zrent_brands.
    IF sy-subrc IS INITIAL.
      out->write( 'All data delete' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
