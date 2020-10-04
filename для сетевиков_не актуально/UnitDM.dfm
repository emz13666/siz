object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 203
  Top = 188
  Height = 570
  Width = 870
  object DS_SIZ: TDataSource
    DataSet = siz
    Left = 96
    Top = 75
  end
  object DS_ZAZEML: TDataSource
    DataSet = zazeml
    Left = 159
    Top = 75
  end
  object DS_elinstr: TDataSource
    DataSet = elektroinstrument
    Left = 228
    Top = 75
  end
  object DS_Takel: TDataSource
    DataSet = takelag
    Left = 281
    Top = 75
  end
  object DS_ElBez: TDataSource
    DataSet = znaniya_el_bez
    Left = 371
    Top = 75
  end
  object DS_GPM: TDataSource
    DataSet = znaniya_gpm
    Left = 439
    Top = 75
  end
  object DS_MetStanki: TDataSource
    DataSet = znaniya_met_stanki
    Left = 45
    Top = 256
  end
  object DS_OTiPB: TDataSource
    DataSet = znaniya_otipb
    Left = 131
    Top = 258
  end
  object DBConnection: TSQLConnection
    ConnectionName = 'siz'
    DriverName = 'MYSQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MYSQL'
      'BlobSize=-1'
      'Database=siz'
      'ErrorResourceFile='
      'HostName='
      'LocaleCode=0000'
      'Password=siz'
      'User_Name=siz')
    VendorLib = 'LIBMYSQL.dll'
    BeforeConnect = DBConnectionBeforeConnect
    Left = 24
    Top = 59
  end
  object siz: TSQLClientDataSet
    CommandText = 'siz'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 96
    Top = 16
    object sizid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object sizid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object sizinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object sizname: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object sizreserv: TStringField
      FieldName = 'reserv'
      Size = 100
    end
    object sizdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object sizdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object sizplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object sizprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object sizname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
    object sizDateOsmotrnext: TDateField
      FieldName = 'DateOsmotrnext'
    end
  end
  object zazeml: TSQLClientDataSet
    CommandText = 'zazeml'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 159
    Top = 16
    object zazemlid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object zazemlid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object zazemlinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object zazemlname: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object zazemlreserv: TStringField
      FieldName = 'reserv'
      Size = 100
    end
    object zazemldate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object zazemldate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object zazemlplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object zazemlprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object zazemlname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
    object zazemlDateOsmotrnext: TDateField
      FieldName = 'DateOsmotrnext'
    end
  end
  object uchastok: TSQLClientDataSet
    CommandText = 'uchastok'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 16
    Top = 153
    object uchastokid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object uchastokname: TStringField
      FieldName = 'name'
      Size = 100
    end
  end
  object elektroinstrument: TSQLClientDataSet
    CommandText = 'elektroinstrument'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 228
    Top = 16
    object elektroinstrumentid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object elektroinstrumentid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object elektroinstrumentinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object elektroinstrumentname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object elektroinstrumentreserv: TStringField
      FieldName = 'reserv'
      Size = 100
    end
    object elektroinstrumentdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object elektroinstrumentdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object elektroinstrumentplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object elektroinstrumentprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object elektroinstrumentname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object Query: TSQLQuery
    SQLConnection = DBConnection
    Params = <>
    Left = 24
    Top = 8
  end
  object takelag: TSQLClientDataSet
    CommandText = 'takelag'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 289
    Top = 16
    object takelagid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object takelagid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object takelaginv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object takelagname: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object takelagreserv: TStringField
      FieldName = 'reserv'
      Size = 100
    end
    object takelagdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object takelagdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object takelagplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object takelagprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object takelagname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object znaniya_el_bez: TSQLClientDataSet
    CommandText = 'znaniya_el_bez'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 379
    Top = 8
    object znaniya_el_bezid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_el_beztab_num: TFMTBCDField
      FieldName = 'tab_num'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_el_bezid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_el_bezfam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object znaniya_el_bezname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object znaniya_el_bezsec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object znaniya_el_bezdolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object znaniya_el_bezgruppa_el: TSmallintField
      FieldName = 'gruppa_el'
      Required = True
    end
    object znaniya_el_bezdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object znaniya_el_bezdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object znaniya_el_beznum_protokol: TStringField
      FieldName = 'num_protokol'
      Size = 30
    end
    object znaniya_el_beznum_udost: TStringField
      FieldName = 'num_udost'
      Size = 50
    end
    object znaniya_el_bezprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object znaniya_el_bezreserv: TSmallintField
      FieldName = 'reserv'
    end
    object znaniya_el_bezname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object znaniya_gpm: TSQLClientDataSet
    CommandText = 'znaniya_gpm'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 439
    Top = 16
    object znaniya_gpmid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_gpmtab_num: TFMTBCDField
      FieldName = 'tab_num'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_gpmid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_gpmfam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object znaniya_gpmname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object znaniya_gpmsec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object znaniya_gpmdolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object znaniya_gpmprofessiya: TStringField
      FieldName = 'professiya'
      Required = True
      Size = 255
    end
    object znaniya_gpmdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object znaniya_gpmdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object znaniya_gpmnum_protokol: TStringField
      FieldName = 'num_protokol'
      Size = 30
    end
    object znaniya_gpmprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object znaniya_gpmreserv: TSmallintField
      FieldName = 'reserv'
    end
    object znaniya_gpmname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
    object znaniya_gpmnum_udost: TStringField
      FieldName = 'num_udost'
      Size = 30
    end
  end
  object znaniya_met_stanki: TSQLClientDataSet
    CommandText = 'znaniya_met_stanki'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 40
    Top = 200
    object znaniya_met_stankiid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_met_stankitab_num: TFMTBCDField
      FieldName = 'tab_num'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_met_stankiid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_met_stankifam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object znaniya_met_stankiname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object znaniya_met_stankisec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object znaniya_met_stankidolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object znaniya_met_stankidate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object znaniya_met_stankidate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object znaniya_met_stankinum_protokol: TStringField
      FieldName = 'num_protokol'
      Size = 30
    end
    object znaniya_met_stankiprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object znaniya_met_stankireserv: TSmallintField
      FieldName = 'reserv'
    end
    object znaniya_met_stankiname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
    object znaniya_met_stankinum_udost: TStringField
      FieldName = 'num_udost'
      Size = 30
    end
  end
  object znaniya_otipb: TSQLClientDataSet
    CommandText = 'znaniya_otipb'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 136
    Top = 200
    object znaniya_otipbid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_otipbtab_num: TFMTBCDField
      FieldName = 'tab_num'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_otipbid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object znaniya_otipbfam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object znaniya_otipbname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object znaniya_otipbsec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object znaniya_otipbdolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object znaniya_otipbdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object znaniya_otipbdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object znaniya_otipbnum_protokol: TStringField
      FieldName = 'num_protokol'
      Size = 30
    end
    object znaniya_otipbprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object znaniya_otipbreserv: TSmallintField
      FieldName = 'reserv'
    end
    object znaniya_otipbname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
    object znaniya_otipbnum_udost: TStringField
      FieldName = 'num_udost'
      Size = 30
    end
  end
  object sl_tab_number: TSQLClientDataSet
    CommandText = 'sl_tab_number'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 248
    Top = 192
    object sl_tab_numbersl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_prof_dolgnost: TSQLClientDataSet
    CommandText = 'sl_prof_dolgnost'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 408
    Top = 192
    object sl_prof_dolgnostsl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_num_prot: TSQLClientDataSet
    CommandText = 'sl_num_prot'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 336
    Top = 248
    object sl_num_protsl: TStringField
      FieldName = 'sl'
      Size = 50
    end
  end
  object sl_inv_number: TSQLClientDataSet
    CommandText = 'sl_inv_number'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 416
    Top = 312
    object sl_inv_numbersl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_place: TSQLClientDataSet
    CommandText = 'sl_place'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 336
    Top = 192
    object sl_placesl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_familiya: TSQLClientDataSet
    CommandText = 'sl_familiya'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 416
    Top = 248
    object sl_familiyasl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_otchestvo: TSQLClientDataSet
    CommandText = 'sl_otchestvo'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 336
    Top = 312
    object sl_otchestvosl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_sec_prof: TSQLClientDataSet
    CommandText = 'sl_sec_prof'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 488
    Top = 192
    object sl_sec_profsl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_name: TSQLClientDataSet
    CommandText = 'sl_name'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 488
    Top = 304
    object sl_namesl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object sl_imya: TSQLClientDataSet
    CommandText = 'sl_imya'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 488
    Top = 256
    object sl_imyasl: TStringField
      FieldName = 'sl'
      Size = 255
    end
  end
  object kniga_otzivov: TSQLClientDataSet
    CommandText = 'kniga_otzivov'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 616
    Top = 224
    object kniga_otzivovid: TFMTBCDField
      FieldName = 'id'
      Required = True
      Precision = 20
      Size = 0
    end
    object kniga_otzivovotziv: TMemoField
      FieldName = 'otziv'
      BlobType = ftMemo
      Size = 1
    end
    object kniga_otzivovname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object kniga_otzivovdate_time: TSQLTimeStampField
      FieldName = 'date_time'
    end
    object kniga_otzivovip_address: TStringField
      FieldName = 'ip_address'
      Size = 15
    end
    object kniga_otzivovmac_address: TStringField
      FieldName = 'mac_address'
      Size = 25
    end
  end
  object DS_kniga: TDataSource
    DataSet = kniga_otzivov
    Left = 616
    Top = 288
  end
  object ognetush: TSQLClientDataSet
    CommandText = 'ognetush'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 505
    Top = 16
    object ognetushid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object ognetushid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object ognetushinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object ognetushname: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object ognetushreserv: TStringField
      FieldName = 'reserv'
      Size = 100
    end
    object ognetushdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object ognetushdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object ognetushplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object ognetushprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object ognetushname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_Ognetush: TDataSource
    DataSet = ognetush
    Left = 505
    Top = 75
  end
  object others: TSQLClientDataSet
    CommandText = 'others'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 566
    Top = 16
    object othersid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object othersid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object othersname: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object othersdate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object othersdate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object othersplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object othersinv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object othersname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_Others: TDataSource
    DataSet = others
    Left = 569
    Top = 75
  end
  object trenirovki: TSQLClientDataSet
    CommandText = 'trenirovki'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 632
    Top = 17
    object trenirovkiid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object trenirovkivid: TStringField
      FieldName = 'vid'
      Required = True
      Size = 100
    end
    object trenirovkitub_num: TFMTBCDField
      FieldName = 'tub_num'
      Required = True
      Precision = 20
      Size = 0
    end
    object trenirovkiid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object trenirovkifam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object trenirovkiname: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object trenirovkisec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object trenirovkidolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object trenirovkitema: TStringField
      FieldName = 'tema'
      Required = True
      Size = 255
    end
    object trenirovkidate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object trenirovkidate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object trenirovkifam_instruktor: TStringField
      FieldName = 'fam_instruktor'
      Required = True
      Size = 100
    end
    object trenirovkiname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_trenirovki: TDataSource
    DataSet = trenirovki
    Left = 636
    Top = 76
  end
  object sl_vid_trenirovki: TSQLClientDataSet
    CommandText = 'sl_vid_trenirovki'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 248
    Top = 245
    object sl_vid_trenirovkisl: TStringField
      FieldName = 'sl'
      Required = True
      Size = 100
    end
  end
  object sl_vid_instruktag: TSQLClientDataSet
    CommandText = 'sl_vid_instruktag'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 248
    Top = 311
    object StringField1: TStringField
      FieldName = 'sl'
      Required = True
      Size = 100
    end
  end
  object instruktagi: TSQLClientDataSet
    CommandText = 'instruktagi'
    Aggregates = <>
    IndexFieldNames = 'date_next'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 704
    Top = 16
    object instruktagiid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object instruktagivid: TStringField
      FieldName = 'vid'
      Required = True
      Size = 100
    end
    object instruktagitub_num: TFMTBCDField
      FieldName = 'tub_num'
      Required = True
      Precision = 20
      Size = 0
    end
    object instruktagiid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object instruktagifam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object instruktaginame: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object instruktagisec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object instruktagidolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object instruktagitema: TStringField
      FieldName = 'tema'
      Required = True
      Size = 255
    end
    object instruktagidate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object instruktagidate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object instruktagifam_instruktor: TStringField
      FieldName = 'fam_instruktor'
      Required = True
      Size = 100
    end
    object instruktaginame_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_Instruktagi: TDataSource
    DataSet = instruktagi
    Left = 712
    Top = 77
  end
  object tblinfo: TSQLClientDataSet
    CommandText = 'info'
    Aggregates = <>
    IndexFieldNames = 'flag_razdel; name_info'
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 712
    Top = 224
    object tblinfoid_info: TFMTBCDField
      FieldName = 'id_info'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object tblinfoname_info: TStringField
      FieldName = 'name_info'
      Required = True
      Size = 255
    end
    object tblinfoshifr_info: TStringField
      FieldName = 'shifr_info'
      Size = 255
    end
    object tblinfoflag_razdel: TIntegerField
      FieldName = 'flag_razdel'
      Required = True
    end
    object tblinfoid_razdel: TIntegerField
      FieldName = 'id_razdel'
      Required = True
    end
  end
  object DS_tblinfo: TDataSource
    DataSet = tblinfo
    Left = 712
    Top = 296
  end
  object Query_date: TSQLQuery
    SQLConnection = DBConnection
    Params = <>
    Left = 20
    Top = 105
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 1981
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    OnClientError = ServerSocket1ClientError
    Left = 224
    Top = 136
  end
  object meropr: TSQLClientDataSet
    CommandText = 'meropr'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    OnCalcFields = meroprCalcFields
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 549
    Top = 229
    object meroprid_meropr: TFMTBCDField
      FieldName = 'id_meropr'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object meroprname_meropr: TStringField
      FieldName = 'name_meropr'
      Required = True
      Size = 255
    end
    object meroprsrok_ispoln: TDateField
      FieldName = 'srok_ispoln'
      Required = True
    end
    object meroprOtm_vipoln: TStringField
      FieldName = 'Otm_vipoln'
      Size = 255
    end
    object meroprvipolneno: TSmallintField
      FieldName = 'vipolneno'
      Required = True
    end
    object meroprvip_vichisl: TStringField
      FieldKind = fkCalculated
      FieldName = 'vip_vichisl'
      Calculated = True
    end
    object meroprid_uchastok: TFMTBCDField
      FieldName = 'id_uchastok'
      Required = True
      Precision = 20
      Size = 0
    end
    object meroprfam_otvetstv: TStringField
      FieldName = 'fam_otvetstv'
      Required = True
      Size = 100
    end
    object meropruchastok_look: TStringField
      FieldKind = fkLookup
      FieldName = 'uchastok_look'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uchastok'
      Lookup = True
    end
    object meroprdate_end: TDateField
      FieldName = 'date_end'
    end
  end
  object DS_meropr: TDataSource
    DataSet = meropr
    Left = 552
    Top = 288
  end
  object DS_sequrity: TDataSource
    DataSet = Sequrity
    Left = 683
    Top = 154
  end
  object Sequrity: TSQLClientDataSet
    CommandText = 'sequrity'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 611
    Top = 157
    object Sequrityid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object Sequritylogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 50
    end
    object Sequritypassword: TStringField
      FieldName = 'password'
      Required = True
      Size = 50
    end
    object Sequrityid_uchastok: TFMTBCDField
      FieldName = 'id_uchastok'
      Required = True
      Precision = 20
      Size = 0
    end
    object SequrityUshastok_look: TStringField
      FieldKind = fkLookup
      FieldName = 'Ushastok_look'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uchastok'
      Lookup = True
    end
  end
  object metrologiya: TSQLClientDataSet
    CommandText = 'metrologiya'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 330
    Top = 32
    object metrologiyaid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object metrologiyaid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object metrologiyainv_number: TStringField
      FieldName = 'inv_number'
      Size = 50
    end
    object metrologiyaname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object metrologiyareserv: TStringField
      FieldName = 'reserv'
      Size = 100
    end
    object metrologiyadate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object metrologiyadate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object metrologiyaplace_install: TStringField
      FieldName = 'place_install'
      Size = 255
    end
    object metrologiyaprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object metrologiyaname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_metrologiya: TDataSource
    DataSet = metrologiya
    Left = 322
    Top = 123
  end
  object flurografia: TSQLClientDataSet
    CommandText = 'flurografia'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 806
    Top = 16
    object flurografiaid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object flurografiatab_num: TFMTBCDField
      FieldName = 'tab_num'
      Precision = 20
      Size = 0
    end
    object flurografiaid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object flurografiafam: TStringField
      FieldName = 'fam'
      Required = True
      Size = 100
    end
    object flurografianame: TStringField
      FieldName = 'name'
      Required = True
      Size = 100
    end
    object flurografiasec_name: TStringField
      FieldName = 'sec_name'
      Required = True
      Size = 100
    end
    object flurografiadolgnost: TStringField
      FieldName = 'dolgnost'
      Required = True
      Size = 100
    end
    object flurografiadate_first: TDateField
      FieldName = 'date_first'
      Required = True
    end
    object flurografiadate_next: TDateField
      FieldName = 'date_next'
      Required = True
    end
    object flurografiaprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object flurografiareserv: TSmallintField
      FieldName = 'reserv'
    end
    object flurografianame_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_flurografia: TDataSource
    DataSet = flurografia
    Left = 806
    Top = 77
  end
  object tmc: TSQLClientDataSet
    CommandText = 'tmc'
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 46
    Top = 383
    object tmcid: TFMTBCDField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object tmcid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object tmcname: TStringField
      FieldName = 'name'
      Required = True
      Size = 255
    end
    object tmcfirma: TStringField
      FieldName = 'firma'
      Size = 255
    end
    object tmcmodel: TStringField
      FieldName = 'model'
      Size = 255
    end
    object tmcinv_num: TStringField
      FieldName = 'inv_num'
      Size = 50
    end
    object tmcnomenkl_num: TStringField
      FieldName = 'nomenkl_num'
      Size = 50
    end
    object tmcserial_num: TStringField
      FieldName = 'serial_num'
      Size = 50
    end
    object tmckol_vo: TStringField
      FieldName = 'kol_vo'
      Required = True
      Size = 10
    end
    object tmced_izm: TStringField
      FieldName = 'ed_izm'
      Required = True
      Size = 50
    end
    object tmcdate_input: TDateField
      FieldName = 'date_input'
      Required = True
    end
    object tmcplace_install: TStringField
      FieldName = 'place_install'
      Size = 100
    end
    object tmcstoimost: TStringField
      FieldName = 'stoimost'
      Size = 100
    end
    object StringField7: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Size = 30
      Lookup = True
    end
    object tmcprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object tmcColor: TIntegerField
      FieldName = 'Color'
    end
    object tmcif_mobila: TSmallintField
      FieldName = 'if_mobila'
      Required = True
    end
    object tmcif_malocenka: TSmallintField
      FieldName = 'if_malocenka'
      Required = True
    end
    object tmcif_mebel: TSmallintField
      FieldName = 'if_mebel'
    end
    object tmcif_orgtehnics: TSmallintField
      FieldName = 'if_orgtehnics'
      Required = True
    end
    object tmcif_phone: TSmallintField
      FieldName = 'if_phone'
      Required = True
    end
    object tmcSostoyanie: TStringField
      FieldName = 'Sostoyanie'
      Size = 50
    end
    object tmcmol: TStringField
      DisplayWidth = 20
      FieldName = 'mol'
      Size = 50
    end
  end
  object DS_tmc: TDataSource
    DataSet = tmc
    Left = 46
    Top = 444
  end
  object sl_query: TSQLClientDataSet
    CommandText = 'sl_name'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 488
    Top = 421
  end
  object rooms: TSQLClientDataSet
    CommandText = 'rooms'
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    CommandType = ctTable
    DBConnection = DBConnection
    Left = 136
    Top = 383
    object roomsid_rooms: TFMTBCDField
      FieldName = 'id_rooms'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
    object roomsid_uch: TFMTBCDField
      FieldName = 'id_uch'
      Required = True
      Precision = 20
      Size = 0
    end
    object roomsname_room: TStringField
      FieldName = 'name_room'
      Required = True
      Size = 255
    end
    object roomsplace_room: TStringField
      FieldName = 'place_room'
      Required = True
      Size = 255
    end
    object roomsarea_room: TStringField
      FieldName = 'area_room'
      Size = 10
    end
    object roomslink_tmc_place: TStringField
      FieldName = 'link_tmc_place'
      Size = 255
    end
    object roomsnumber_room: TStringField
      FieldName = 'number_room'
      Size = 10
    end
    object roomsnaznachenie: TStringField
      FieldName = 'naznachenie'
      Size = 255
    end
    object roomssostoyanie: TStringField
      FieldName = 'sostoyanie'
      Size = 255
    end
    object roomsprim: TStringField
      FieldName = 'prim'
      Size = 255
    end
    object roomsname_uch: TStringField
      FieldKind = fkLookup
      FieldName = 'name_uch'
      LookupDataSet = uchastok
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'id_uch'
      Lookup = True
    end
  end
  object DS_rooms: TDataSource
    DataSet = rooms
    Left = 136
    Top = 444
  end
end
