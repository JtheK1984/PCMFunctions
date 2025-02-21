unit PCM.Reports;

interface
////////////////////////////////////////////////////////////////////////////////
// Deklaration                                                                //
////////////////////////////////////////////////////////////////////////////////
{$Region Deklaration}
// PCM-Zeiterfassung
procedure Drucke_PCM_ZE_Jahresbericht(AJahr: String);
procedure Drucke_PCM_ZE_Monatsbericht(AMonat: integer; AJahr: String);
// PCM-Manager
procedure Drucke_PCM_Manager_Finanzuebersicht(AMonat,AJahr:integer);

{$EndRegion Deklaration}
implementation

uses
  {$Region Uses}
  PCM.Data,
  PCM.Calculate,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  System.DateUtils,
  System.Sysutils,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  system.ioutils,
  vcl.Forms,
  PCM.Browser.FullScreen,
  Data.DB;

  {$EndRegion Uses}
procedure Drucke_PCM_ZE_Jahresbericht(AJahr: String);
var
  slFileXML: TStringList;
  iIstnetto: integer;
  iFehlzeit: integer;
begin
  slFileXML:= TStringList.Create;
  slFileXML.Add('<!DOCTYPE html>');
  slFileXML.Add('<html>');
  slFileXML.Add('  <head>');
  slFileXML.Add('    <title>PCM - Jahresübersicht</title>');
  slFileXML.Add('    <meta http-equiv="content-type" content="text/html; charset=Windows-1252"/>');
  slFileXML.Add('    <style type="text/css">body {background: #086A87;}');
  slFileXML.Add('		.container-table {margin: auto;	margin-top: calc(8vh - 7px); margin-bottom: calc(8vh - 7px); width: 80vw; min-height: 8vh; display: block; overflow: auto; -moz-box-shadow: 0px 0px 10px #ccc; -webkit-box-shadow: 0px 0px 10px #ccc; border-bottom: solid 5px #93a8d8;}');
  slFileXML.Add('		.container-table {padding: 15px 15px 15px 15px;width: 80%; }');
  slFileXML.Add('		.container-table-background{background-color: white;}');
  slFileXML.Add('		.container-table * {font-family: "Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, Verdana, sans-serif;}');
  slFileXML.Add('		.container-table h2 {font-size: 20px; font-weight: 100;}');
  slFileXML.Add('		.Report {width: calc(50% - 15px); float: left; text-align: left;}');
  slFileXML.Add('		.Datumuhrzeit {width: calc(50% - 15px); float: right; text-align: right;}');
  slFileXML.Add('		.divider {height: 5px; width: 100%; background-color: #086A87}');
  slFileXML.Add('		#search {outline: none; margin-top: 0px; margin-bottom: 15px;  width: 100%; display: block; border: none; border-bottom: solid 2px #c9c9c9; transition: border 0.3s;}');
  slFileXML.Add('		#search:focus, #search.focus {border-bottom: solid 2px #969696;}');
  slFileXML.Add('		table {width: 100%;border-collapse:collapse; padding: 0px 15px 0px 15px;}');
  slFileXML.Add('		table thead th {padding: 15px 0px 0px 0px;}');
  slFileXML.Add('		table tbody th {border-top: 1px solid black; padding: 5px 0px 0px 0px}');
  slFileXML.Add('		table tfoot th {border-bottom: 5px double black;padding: 20px 0px 0px 0px;}');
  slFileXML.Add('		th {padding-bottom: 5px; text-align: Left}');
  slFileXML.Add('		th.big11 {padding-bottom: 5px; text-align: Center; width:500}');
  slFileXML.Add('		th.big1 {padding-bottom: 5px; text-align: Left; width:500}');
  slFileXML.Add('		th.small1 {padding-bottom: 5px; text-align: right; width:200}');
  slFileXML.Add('		th.big {border-width: 0;padding-bottom: 5px; text-align: Left; width:500}');
  slFileXML.Add('		th.small {border-width: 0;padding-bottom: 5px; text-align: right; width:200}');
  slFileXML.Add('		td {padding-top: 1px; padding-bottom: 1px; font-size: 15px;}');
  slFileXML.Add('		.status-fields {float: left; display: flex; flex-wrap: wrap; width: calc( 100% - 20px ); text-align: center; margin: 20px 10px 20px 10px;}');
  slFileXML.Add('		div.status-fields>div {width: calc( 20% - 20px ); display: flex; align-items: center; justify-content: center; flex-direction: column; margin: 5px 5px 5px 5px; padding: 10px 5px 10px 5px; float: left; }');
  slFileXML.Add('		div.status-fields>tr {display: none;} div.status-fields>tr>td {display: none;}');
  slFileXML.Add('		.mobile-hidden {display: none;}</style>');
  slFileXML.Add('  </head>');
  slFileXML.Add('  <body>');
  slFileXML.Add('      <div class="container-table container-table-background">');
  slFileXML.Add('      <div class="Report">');
  slFileXML.Add('        <h2>PCM - Jahresübersicht für ' + AJahr + '</h2>');
  slFileXML.Add('      </div>');
  slFileXML.Add('      <div class="Datumuhrzeit">');
  slFileXML.Add('        <h2>' + DatetoStr(Date()) + ' - ' + Copy(TimeToStr(Now()),1,5) + ' Uhr</h2>');
  slFileXML.Add('      </div>');
  slFileXML.Add('      <div style="clear: both;">');
  slFileXML.Add('				<input id="search" placeholder="Suchen"/>');
  slFileXML.Add('				<div class="divider">');
  slFileXML.Add('					<div class="status-fields">');
  slFileXML.Add('						<table id="tblData">');
  ////////////////////////////////////////////////////////////////////////////
  // Monatswerte                                                            //
  ////////////////////////////////////////////////////////////////////////////
  slFileXML.Add('             <tbody>');
  slFileXML.Add('							  <tr>');
  slFileXML.Add('									<th class="big1">Monat</th>');
  slFileXML.Add('									<th class="big1">Sollzeit</th>');
  slFileXML.Add('									<th class="big1">Istzeit</th>');
  slFileXML.Add('									<th class="big1">Pause</th>');
  slFileXML.Add('									<th class="big1">Gleitzeit</th>');
  slFileXML.Add('									<th class="big1">Gleitzeit. ges.</th>');
  slFileXML.Add('									<th class="big1">Urlaub</th>');
  slFileXML.Add('									<th class="big1">Krank</th>');
  slFileXML.Add('									<th class="big1">Resturlaub</th>');
  slFileXML.Add('									<th class="big1">Feiertage</th>');
  slFileXML.Add('									<th class="big1">Büro</th>');
  slFileXML.Add('									<th class="big1">Homeoffice</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  dm_PCM.qry_work.SQL.Text:= 'Select * From time_monatswerte Where Jahr = :Jahr ORDER BY Monat';
  dm_PCM.qry_work.ParamByName('Jahr').asInteger:= StrToInt(AJahr);
  dm_PCM.qry_work.open;
  while not dm_PCM.qry_work.Eof do
  begin
    slFileXML.Add('             <tbody>');
    slFileXML.Add('							  <tr>');
    slFileXML.Add('									<th class="big1">' + dm_PCM.qry_work.FieldByName('Monat').asString + '</th>');
    slFileXML.Add('									<th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Sollzeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('Sollzeit').asinteger / 60)  + '</th>');
    slFileXML.Add('									<th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Istzeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('istzeit').asinteger / 60)  + '</th>');
    slFileXML.Add('									<th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Pausen').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('Pausen').asinteger / 60)  + '</th>');
    if dm_PCM.qry_work.FieldByName('Mehrarbeit').asinteger < 0 then
      slFileXML.Add('									<th class="big1">-' + GetTimeValue(dm_PCM.qry_work.FieldByName('Mehrarbeit').asinteger * -1) + ' &nbsp; &nbsp;-' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('Mehrarbeit').asinteger / 60 * -1)  + '</th>')
    else
      slFileXML.Add('									<th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Mehrarbeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('Mehrarbeit').asinteger / 60)  + '</th>');
    if dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger < 0 then
      slFileXML.Add('									<th class="big1">-' + GetTimeValue(dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger * -1) + ' &nbsp; &nbsp;-' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger / 60 * -1)  + '</th>')
    else
      slFileXML.Add('									<th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger / 60)  + '</th>');
    slFileXML.Add('									<th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('Urlaub_Bezahlt').AsFloat)  + '</th>');
    slFileXML.Add('									<th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('Krank_Bezahlt').AsFloat )  + '</th>');
    slFileXML.Add('									<th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('Resturlaub').AsFloat)  + '</th>');
    slFileXML.Add('									<th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('Feiertag').AsInteger / 480)  + '</th>');
    slFileXML.Add('									<th class="big1">' + IntToStr(GetBuchungsart(0, StartOfAMonth(StrToInt(AJahr),dm_PCM.qry_work.FieldByName('Monat').AsInteger),EndOfAMonth(StrToInt(AJahr),dm_PCM.qry_work.FieldByName('Monat').AsInteger))) +'</th>');
    slFileXML.Add('									<th class="big1">' + IntToStr(GetBuchungsart(1, StartOfAMonth(StrToInt(AJahr),dm_PCM.qry_work.FieldByName('Monat').AsInteger),EndOfAMonth(StrToInt(AJahr),dm_PCM.qry_work.FieldByName('Monat').AsInteger))) +'</th>');
    slFileXML.Add('								</tr>');
    slFileXML.Add('							</tbody>');
    dm_PCm.qry_Work.Next;
  end;
  dm_PCm.qry_Work.Close;
  slFileXML.Add('             <tbody>');
  slFileXML.Add('							  <tr>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('									<th class="big1"></th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  slFileXML.Add('					</div>');
  slFileXML.Add('				</div>');
  slFileXML.Add('			</div>');
  slFileXML.Add('    </div>');
  dm_PCM.qry_work.SQL.Text:= 'SELECT SUM(sollzeit) as Sollzeit,SUM(Istzeit) as Istzeit,' +
                             'SUM(Pausen) as Pausen,SUM(Istzeit) - SUM(sollzeit) as aktuelleMehrarbeit,'+
                             'SUM(Urlaub_bezahlt) AS UL,SUM(KRank_bezahlt) AS KR,SUM(Feiertag) as Feiertag '+
                             'From time_monatswerte Where Jahr = :Jahr';
  dm_PCM.qry_work.ParamByName('Jahr').AsInteger:= StrToInt(AJahr);
  dm_PCM.qry_work.open;
  slFileXML.Add('    <tfoot>');
  slFileXML.Add('		   <tr>');
  slFileXML.Add('			   <th class="big1">Gesamt:</th>');
  slFileXML.Add('				 <th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Sollzeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('Sollzeit').asinteger / 60)  + '</th>');
  slFileXML.Add('				 <th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Istzeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('istzeit').asinteger / 60)  + '</th>');
  slFileXML.Add('				 <th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('Pausen').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('Pausen').asinteger / 60)  + '</th>');
  slFileXML.Add('				 <th class="big1"></th>');
  if dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger < 0 then
    slFileXML.Add('			   <th class="big1">-' + GetTimeValue(dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger * -1) + ' &nbsp; &nbsp;-' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger / 60 * -1)  + '</th>')
  else
    slFileXML.Add('				 <th class="big1">' + GetTimeValue(dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger) + ' &nbsp; &nbsp;' +  FormatFloat('0.00',dm_PCM.qry_work.FieldByName('aktuelleMehrarbeit').asinteger / 60)  + '</th>');
  slFileXML.Add('				 <th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('UL').AsFloat)  + '</th>');
  slFileXML.Add('				 <th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('KR').AsFloat )  + '</th>');
  slFileXML.Add('				 <th class="big1">' + FormatFloat('0.0',GetRestUrlaub(StrToInt(AJahr),12))  + '</th>');
  slFileXML.Add(' 			 <th class="big1">' + FormatFloat('0.0',dm_PCM.qry_work.FieldByName('Feiertag').AsInteger / 480)  + '</th>');
  slFileXML.Add('				 <th class="big1">' + IntToStr(GetBuchungsart(0, StartOfAMonth(StrToInt(AJahr),1),EndOfAMonth(StrToInt(AJahr),12))) +'</th>');
  slFileXML.Add('				 <th class="big1">' + IntToStr(GetBuchungsart(1, StartOfAMonth(StrToInt(AJahr),1),EndOfAMonth(StrToInt(AJahr),12))) +'</th>');
  slFileXML.Add('			 </tr>');
  slFileXML.Add('		 </tfoot>');
  dm_PCM.qry_work.Close;
  slFileXML.Add('    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>');
  slFileXML.Add('    <script type="text/javascript">$(document).ready(function()');
  slFileXML.Add('{');
  slFileXML.Add('	$(''#search'').keyup(function()');
  slFileXML.Add('	{');
  slFileXML.Add('		searchTable($(this).val());');
  slFileXML.Add('	});');
  slFileXML.Add('});');
  slFileXML.Add('function searchTable(inputVal)');
  slFileXML.Add('{');
  slFileXML.Add('	// Tabellenvariable festlegen');
  slFileXML.Add('	var table = $(''#tblData'');');
  slFileXML.Add('	// Tabelleninhalt Tr finden');
  slFileXML.Add('	table.find(''tr'').each(function(index, row)');
  slFileXML.Add('	{');
  slFileXML.Add('		var allCells = $(row).find(''td'');');
  slFileXML.Add('		if(allCells.length > 0)');
  slFileXML.Add('		{');
  slFileXML.Add('			var found = false;');
  slFileXML.Add('			allCells.each(function(index, td)');
  slFileXML.Add('			{');
  slFileXML.Add('				var regExp = new RegExp(inputVal, ''i'');');
  slFileXML.Add('				if(regExp.test($(td).text()))');
  slFileXML.Add('				{');
  slFileXML.Add('					found = true;');
  slFileXML.Add('					return false;');
  slFileXML.Add('				}');
  slFileXML.Add('			});');
  slFileXML.Add('			if(found == true)$(row).show();else $(row).hide();');
  slFileXML.Add('		};');
  slFileXML.Add('		if(allCells.length < 1)');
  slFileXML.Add('		{');
  slFileXML.Add('			var allCells = $(row).find(''th'');');
  slFileXML.Add('			if(allCells.length > 0)');
  slFileXML.Add('			{');
  slFileXML.Add('				var found = false;');
  slFileXML.Add('				allCells.each(function(index, td)');
  slFileXML.Add('				{');
  slFileXML.Add('					var regExp = new RegExp(inputVal, ''i'');');
  slFileXML.Add('					if(regExp.test($(td).text()))');
  slFileXML.Add('					{');
  slFileXML.Add('						found = true;');
  slFileXML.Add('						return false;');
  slFileXML.Add('					}');
  slFileXML.Add('				});');
  slFileXML.Add('				if(found == true)$(row).show();else $(row).hide();');
  slFileXML.Add('			};');
  slFileXML.Add('		};');
  slFileXML.Add('	});');
  slFileXML.Add('}</script>');
  slFileXML.Add('  </body>');
  slFileXML.Add('</html>');
  slFileXML.SaveToFile(TPath.Combine(TPath.GetDirectoryName(Application.ExeName), 'Report') + '_Monatsbericht.html');
  Application.CreateForm(Tfrm_Browser_FullScreen, frm_Browser_FullScreen);
  frm_Browser_FullScreen.Execute(True,'PCM - Manager: Monatsbericht',TPath.Combine(TPath.GetDirectoryName(Application.ExeName), 'Report') + '_Monatsbericht.html');
end;
procedure Drucke_PCM_ZE_Monatsbericht(AMonat: integer; AJahr: String);
var
  slFileXML: TStringList;
  iIstnetto: integer;
  iFehlzeit: integer;
  iIstbrutto: integer;
begin
  slFileXML:= TStringList.Create;
  slFileXML.Add('<!DOCTYPE html>');
  slFileXML.Add('<html>');
  slFileXML.Add('  <head>');
  slFileXML.Add('    <title>PCM - Monatsübersicht</title>');
  slFileXML.Add('    <meta http-equiv="content-type" content="text/html; charset=Windows-1252"/>');
  slFileXML.Add('    <style type="text/css">body {background: #086A87;}');
  slFileXML.Add('		.container-table {margin: auto;	margin-top: calc(8vh - 7px); margin-bottom: calc(8vh - 7px); width: 80vw; min-height: 8vh; display: block; overflow: auto; -moz-box-shadow: 0px 0px 10px #ccc; -webkit-box-shadow: 0px 0px 10px #ccc; border-bottom: solid 5px #93a8d8;}');
  slFileXML.Add('		.container-table {padding: 15px 15px 15px 15px;width: 80%; }');
  slFileXML.Add('		.container-table-background{background-color: white;}');
  slFileXML.Add('		.container-table * {font-family: "Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, Verdana, sans-serif;}');
  slFileXML.Add('		.container-table h2 {font-size: 20px; font-weight: 100;}');
  slFileXML.Add('		.Report {width: calc(50% - 15px); float: left; text-align: left;}');
  slFileXML.Add('		.Datumuhrzeit {width: calc(50% - 15px); float: right; text-align: right;}');
  slFileXML.Add('		.divider {height: 5px; width: 100%; background-color: #086A87}');
  slFileXML.Add('		#search {outline: none; margin-top: 0px; margin-bottom: 15px;  width: 100%; display: block; border: none; border-bottom: solid 2px #c9c9c9; transition: border 0.3s;}');
  slFileXML.Add('		#search:focus, #search.focus {border-bottom: solid 2px #969696;}');
  slFileXML.Add('		table {width: 100%;border-collapse:collapse; padding: 0px 15px 0px 15px;}');
  slFileXML.Add('		table thead th {padding: 15px 0px 0px 0px;}');
  slFileXML.Add('		table tbody th {border-top: 1px solid black; padding: 5px 0px 0px 0px}');
  slFileXML.Add('		table tfoot th {border-bottom: 5px double black;padding: 20px 0px 0px 0px;}');
  slFileXML.Add('		th {padding-bottom: 5px; text-align: Left}');
  slFileXML.Add('		th.big1 {padding-bottom: 5px; text-align: Left; width:500}');
  slFileXML.Add('		th.small1 {padding-bottom: 5px; text-align: right; width:200}');
  slFileXML.Add('		th.big {border-width: 0;padding-bottom: 5px; text-align: Left; width:500}');
  slFileXML.Add('		th.small {border-width: 0;padding-bottom: 5px; text-align: right; width:200}');
  slFileXML.Add('		td {padding-top: 1px; padding-bottom: 1px; font-size: 15px;}');
  slFileXML.Add('		.status-fields {float: left; display: flex; flex-wrap: wrap; width: calc( 100% - 20px ); text-align: center; margin: 20px 10px 20px 10px;}');
  slFileXML.Add('		div.status-fields>div {width: calc( 20% - 20px ); display: flex; align-items: center; justify-content: center; flex-direction: column; margin: 5px 5px 5px 5px; padding: 10px 5px 10px 5px; float: left; }');
  slFileXML.Add('		div.status-fields>tr {display: none;} div.status-fields>tr>td {display: none;}');
  slFileXML.Add('		.mobile-hidden {display: none;}</style>');
  slFileXML.Add('  </head>');
  slFileXML.Add('  <body>');
  slFileXML.Add('      <div class="container-table container-table-background">');
  slFileXML.Add('      <div class="Report">');
  slFileXML.Add('        <h2>PCM - Monatsübersicht für ' + GetMonthName(AMonat) + ' ' + AJahr + '</h2>');
  slFileXML.Add('      </div>');
  slFileXML.Add('      <div class="Datumuhrzeit">');
  slFileXML.Add('        <h2>' + DatetoStr(Date()) + ' - ' + Copy(TimeToStr(Now()),1,5) + ' Uhr</h2>');
  slFileXML.Add('      </div>');
  slFileXML.Add('      <div style="clear: both;">');
  slFileXML.Add('				<input id="search" placeholder="Suchen"/>');
  slFileXML.Add('				<div class="divider">');
  slFileXML.Add('					<div class="status-fields">');
  slFileXML.Add('						<table id="tblData">');
  ////////////////////////////////////////////////////////////////////////////
  // Tageswerte                                                              //
  ////////////////////////////////////////////////////////////////////////////
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big1">Datum</th>');
  slFileXML.Add('									<th class="big1">Tag</th>');
  slFileXML.Add('									<th class="big1">Typ</th>');
  slFileXML.Add('									<th class="small1">Beginn</th>');
  slFileXML.Add('									<th class="small1">Ende</th>');
  slFileXML.Add('									<th class="small1">Soll. Std</th>');
  slFileXML.Add('									<th class="small1">Soll. Dez</th>');
  slFileXML.Add('									<th class="small1">Ist. Std</th>');
  slFileXML.Add('									<th class="small1">ISt. Dez</th>');
  slFileXML.Add('									<th class="small1">Pau. Std</th>');
  slFileXML.Add('									<th class="small1">Pau. Dez</th>');
  slFileXML.Add('									<th class="small1">Glz. Std</th>');
  slFileXML.Add('									<th class="small1">Glz. Dez</th>');
  slFileXML.Add('									<th class="small1">Fehl.</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  dm_PCM.qry_work.SQL.Text:= 'Select * From time_buchungen Where Datum between :Von and :Bis';
  dm_PCM.qry_work.ParamByName('Von').AsDate:= StartOfAMonth(StrToInt(AJahr),AMonat);
  dm_PCM.qry_work.ParamByName('Bis').AsDate:= EndOfAMonth(StrToInt(AJahr),AMonat);
  dm_PCM.qry_work.open;
  while not dm_PCM.qry_work.Eof do
  begin
    slFileXML.Add('							<tbody>');
    slFileXML.Add('								<tr>');
    slFileXML.Add('									<th class="big1">' + dm_PCM.qry_work.FieldByName('Datum').asString + '</th>');
    slFileXML.Add('									<th class="big1">' + dm_PCM.qry_work.FieldByName('Tag').asString + '</th>');
    // BUCHUNGSART
    if dm_PCM.qry_work.FieldByName('Kommen').asString <> '00:00:00' then
      slFileXML.Add('									<th class="big1">A</th>')
    else
      slFileXML.Add('									<th class="big1"></th>');
    // KOMMEN
    if dm_PCM.qry_work.FieldByName('Kommen').asString <> '00:00:00' then
      slFileXML.Add('									<th class="small1">' + Copy(dm_PCM.qry_work.FieldByName('Kommen').asString,1,5) + '</th>')
    else
      slFileXML.Add('									<th class="small1"></th>');
    // GEHEN
    if dm_PCM.qry_work.FieldByName('Gehen').asString <> '00:00:00' then
      slFileXML.Add('									<th class="small1">' + Copy(dm_PCM.qry_work.FieldByName('Gehen').asString,1,5) + '</th>')
    else
      slFileXML.Add('									<th class="small1"></th>');
    // SOLLSTUNDEN
    if dm_PCM.qry_work.FieldByName('SollstundenI').asInteger > 0 then
    begin
      slFileXML.Add('									<th class="small1">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('SollstundenI').asInteger) + '</th>');
      slFileXML.Add('									<th class="small1">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('SollstundenI').AsFloat / 60) + '</th>');
    end
    else begin
      slFileXML.Add('									<th class="small1"></th>');
      slFileXML.Add('									<th class="small1"></th>');
    end;
    // ISTSTUNDEN
    if dm_PCM.qry_work.FieldByName('ArbeitszeitI').AsInteger > 0 then
    begin
      slFileXML.Add('									<th class="small1">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('ArbeitszeitI').asInteger) + '</th>');
      slFileXML.Add('									<th class="small1">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('ArbeitszeitI').AsFloat / 60) + '</th>');
    end
    else begin
      slFileXML.Add('									<th class="small1"></th>');
      slFileXML.Add('									<th class="small1"></th>');
    end;
    // PAUSEN
    if dm_PCM.qry_work.FieldByName('PausenI').AsInteger > 0 then
    begin
      slFileXML.Add('									<th class="small1">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('PausenI').asInteger) + '</th>');
      slFileXML.Add('									<th class="small1">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('PausenI').AsFloat / 60) + '</th>');
    end
    else begin
      slFileXML.Add('									<th class="small1"></th>');
      slFileXML.Add('									<th class="small1"></th>');
    end;
    // GLZ
    if dm_PCM.qry_work.FieldByName('MehrarbeitI').AsInteger <> 0 then
    begin
      if dm_PCM.qry_Work.FieldByName('MehrarbeitI').asInteger < 0 then
      begin
        slFileXML.Add('									<th class="small1">-' + GetTimeValue(dm_PCM.qry_Work.FieldByName('MehrarbeitI').asInteger * -1) + '</th>');
      end
      else begin
        slFileXML.Add('									<th class="small1">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('MehrarbeitI').asInteger) + '</th>');
      end;
      slFileXML.Add('									<th class="small1">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('MehrarbeitI').AsFloat / 60) + '</th>');
    end
    else begin
      slFileXML.Add('									<th class="small1"></th>');
      slFileXML.Add('									<th class="small1"></th>');
    end;
    if dm_PCM.qry_work.FieldByName('Feiertag').AsInteger > 0 then
    begin
      if dm_PCM.qry_work.FieldByName('Fehltag').AsString <> ' ' then
        slFileXML.Add('									<th class="small1">' + dm_PCM.qry_Work.FieldByName('Fehltag').AsString + '/FT' + dm_PCM.qry_work.FieldByName('Feiertag').AsString + '</th>')
      else
        slFileXML.Add('									<th class="small1">' + 'FT' + dm_PCM.qry_work.FieldByName('Feiertag').AsString + '</th>')
    end
    else begin
      slFileXML.Add('									<th class="small1">' + dm_PCM.qry_Work.FieldByName('Fehltag').AsString + '</th>');
    end;
    slFileXML.Add('								</tr> ');
    slFileXML.Add('							</tbody>');
    dm_PCM.qry_Work1.SQL.Text:= 'SELECT Pause1Beginn,Pause1Ende,Pause2Beginn,Pause2Ende From time_buchungen Where ID = :ID';
    dm_PCM.qry_Work1.ParamByName('ID').AsInteger:= dm_PCM.qry_Work.FieldByName('ID').AsInteger;
    dm_PCM.qry_Work1.Open;
    if dm_PCM.qry_Work1.FieldByName('Pause1Beginn').asString <> '00:00:00' then
    begin
      slFileXML.Add('							<tbody>');
      slFileXML.Add('								<tr>');
      slFileXML.Add('									<th class="big"></th>');
      slFileXML.Add('									<th class="big"></th>');
      slFileXML.Add('									<th class="big">P</th>');
      slFileXML.Add('									<th class="small">' + Copy(dm_PCM.qry_Work1.FieldByName('Pause1Beginn').asString,1,5) + '</th>');
      slFileXML.Add('									<th class="small">' + Copy(dm_PCM.qry_Work1.FieldByName('Pause1Ende').asString,1,5) + '</th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('								</tr> ');
      slFileXML.Add('							</tbody>');
    end;
    if dm_PCM.qry_Work1.FieldByName('Pause2Beginn').asString <> '00:00:00' then
    begin
      slFileXML.Add('							<tbody>');
      slFileXML.Add('								<tr>');
      slFileXML.Add('									<th class="big"></th>');
      slFileXML.Add('									<th class="big"></th>');
      slFileXML.Add('									<th class="big">P</th>');
      slFileXML.Add('									<th class="small">' + Copy(dm_PCM.qry_Work1.FieldByName('Pause2Beginn').asString,1,5) + '</th>');
      slFileXML.Add('									<th class="small">' + Copy(dm_PCM.qry_Work1.FieldByName('Pause2Ende').asString,1,5) + '</th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('									<th class="small"></th>');
      slFileXML.Add('								</tr> ');
      slFileXML.Add('							</tbody>');
    end;
    dm_PCM.qry_Work1.Close;
    dm_PCm.qry_Work.Next;
  end;
  dm_PCm.qry_Work.Close;
  slFileXML.Add('					</div>');
  slFileXML.Add('				</div>');
  slFileXML.Add('			</div>');
  slFileXML.Add('    </div>');
  // Monatswerte
  slFileXML.Add('	<table>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Monatswerte Stunden</th>');
  slFileXML.Add('				<th class="small">HH:MM</th>');
  slFileXML.Add('				<th class="small">Dez.</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Monatswerte Tage</th>');
  slFileXML.Add('				<th class="small">Tage</th>');
  slFileXML.Add('				<th class="small">Dez.</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  dm_PCM.qry_work.SQL.Text:= 'Select * From time_Monatswerte Where Monat = :Monat and Jahr = :Jahr';
  dm_PCM.qry_work.ParamByName('Monat').AsInteger:= AMonat;
  dm_PCM.qry_work.ParamByName('Jahr').AsInteger:= StrToInt(AJahr);
  dm_PCM.qry_work.open;
  iIStBrutto:=  dm_PCM.qry_Work.FieldByName('Istzeit').asinteger +
                dm_PCM.qry_Work.FieldByName('Pausen').asinteger -
                Round(dm_PCM.qry_Work.FieldByName('Urlaub_Bezahlt').AsFloat * 480) -
                dm_PCM.qry_Work.FieldByName('Feiertag').AsInteger -
                Round(dm_PCM.qry_Work.FieldByName('krank_Bezahlt').AsFloat * 480);
  iIstnetto:=   dm_PCM.qry_Work.FieldByName('Istzeit').asinteger -
                Round(dm_PCM.qry_Work.FieldByName('Urlaub_Bezahlt').AsFloat * 480) -
                dm_PCM.qry_Work.FieldByName('Feiertag').AsInteger -
                Round(dm_PCM.qry_Work.FieldByName('krank_Bezahlt').AsFloat * 480);
  iFehlzeit:=   Round(dm_PCM.qry_Work.FieldByName('Urlaub_Bezahlt').AsFloat * 480) +
                dm_PCM.qry_Work.FieldByName('Feiertag').AsInteger +
                Round(dm_PCM.qry_Work.FieldByName('krank_Bezahlt').AsFloat * 480);
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('			  <th class="big1">Iststunden brutto</th>');
  slFileXML.Add('				<th class="small1">' + GetTimeValue(iIStBrutto) + '</th>');
  slFileXML.Add('				<th class="small1">' + FormatFloat('0.00',iIStBrutto / 60) + '</th>');
  slFileXML.Add('				<th class="big1"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big1">Urlaub</th>');
  slFileXML.Add('				<th class="small1">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Urlaub_Bezahlt').AsFloat) + '</th>');
  slFileXML.Add('				<th class="small1">' + GetTimeValue(Round(dm_PCM.qry_Work.FieldByName('Urlaub_Bezahlt').AsFloat * 480)) + '</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Pausen</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('Pausen').asinteger) + '</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Pausen').AsFloat / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Resturlaub</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('RestUrlaub').AsFloat) + '</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(Round(dm_PCM.qry_Work.FieldByName('RestUrlaub').AsFloat * 480)) + '</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Iststunden netto</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(iIstnetto) + '</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',iIstnetto / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Urlaub unbezahlt</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Urlaub_unBezahlt').AsFloat) + '</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(Round(dm_PCM.qry_Work.FieldByName('Urlaub_unBezahlt').AsFloat * 480)) + '</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Fehlzeit</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(iFehlzeit) + '</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',iFehlzeit / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Feiertage</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Feiertag').Asinteger / 480) + '</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('Feiertag').AsInteger) + '</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Iststunden netto (inkl. Fehlzeit)</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('istzeit').asinteger) + '</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('istzeit').asinteger / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Krank bezahlt</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Krank_Bezahlt').AsFloat) + '</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(Round(dm_PCM.qry_Work.FieldByName('Krank_Bezahlt').AsFloat * 480)) + '</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Sollstunden</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('Sollzeit').asinteger) + '</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Sollzeit').asinteger / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Krank unbezahlt</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Krank_unBezahlt').AsFloat) + '</th>');
  slFileXML.Add('				<th class="small">' + GetTimeValue(Round(dm_PCM.qry_Work.FieldByName('Krank_unBezahlt').AsFloat * 480)) + '</th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Minder/Mehrarbeit</th>');
  if dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger < 0 then
  begin
    slFileXML.Add('				<th class="small">-' + GetTimeValue(dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger *-1)  + '</th>');
  end
  else begin
    slFileXML.Add('				<th class="small">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger) + '</th>');
  end;
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Büro-Tage</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',GetBuchungsart(0, StartOfAMonth(StrToint(AJahr),AMonat),EndOfAMonth(StrToint(AJahr),AMonat))) + '</th>');
  slFileXML.Add('				<th class="small"></th>');
  slFileXML.Add('			</tr> ');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big">Gleitzeitübertrag Vormonat</th>');
  if dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asInteger - dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger < 0 then
  begin
    slFileXML.Add('				<th class="small">' + GetTimeValue((dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asinteger - dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger) *-1)  + '</th>');
  end
  else begin
    slFileXML.Add('				<th class="small">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asinteger - dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger) + '</th>');
  end;
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',(dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asinteger - dm_PCM.qry_Work.FieldByName('Mehrarbeit').asinteger) / 60) + '</th>');
  slFileXML.Add('				<th class="big"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big">Homeoffice-Tage</th>');
  slFileXML.Add('				<th class="small">' + FormatFloat('0.00',GetBuchungsart(1, StartOfAMonth(StrToint(AJahr),AMonat),EndOfAMonth(StrToint(AJahr),AMonat))) + '</th>');
  slFileXML.Add('				<th class="small"></th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  slFileXML.Add('		<tbody>');
  slFileXML.Add('			<tr>');
  slFileXML.Add('				<th class="big1">Gleitzeitübertrag Folgemonat</th>');
  if dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asInteger < 0 then
  begin
    slFileXML.Add('				<th class="small1">-' + GetTimeValue(dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asinteger * -1) + '</th>');
  end
  else begin
    slFileXML.Add('				<th class="small1">' + GetTimeValue(dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asinteger) + '</th>');
  end;
  slFileXML.Add('				<th class="small1">' + FormatFloat('0.00',dm_PCM.qry_Work.FieldByName('aktuelleMehrarbeit').asinteger / 60) + '</th>');
  slFileXML.Add('				<th class="big1"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>');
  slFileXML.Add('				<th class="big1">Tage</th>');
  slFileXML.Add('				<th class="small1">' + FormatFloat('0.00',GetBuchungsart(0, StartOfAMonth(StrToint(AJahr),AMonat),EndOfAMonth(StrToint(AJahr),AMonat)) + GetBuchungsart(1, StartOfAMonth(StrToint(AJahr),AMonat),EndOfAMonth(StrToint(AJahr),AMonat))) + '</th>');
  slFileXML.Add('				<th class="small1"></th>');
  slFileXML.Add('			</tr>');
  slFileXML.Add('		</tbody>');
  dm_PCM.qry_work.Close;
  slFileXML.Add('    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>');
  slFileXML.Add('    <script type="text/javascript">$(document).ready(function()');
  slFileXML.Add('{');
  slFileXML.Add('	$(''#search'').keyup(function()');
  slFileXML.Add('	{');
  slFileXML.Add('		searchTable($(this).val());');
  slFileXML.Add('	});');
  slFileXML.Add('});');
  slFileXML.Add('function searchTable(inputVal)');
  slFileXML.Add('{');
  slFileXML.Add('	// Tabellenvariable festlegen');
  slFileXML.Add('	var table = $(''#tblData'');');
  slFileXML.Add('	// Tabelleninhalt Tr finden');
  slFileXML.Add('	table.find(''tr'').each(function(index, row)');
  slFileXML.Add('	{');
  slFileXML.Add('		var allCells = $(row).find(''td'');');
  slFileXML.Add('		if(allCells.length > 0)');
  slFileXML.Add('		{');
  slFileXML.Add('			var found = false;');
  slFileXML.Add('			allCells.each(function(index, td)');
  slFileXML.Add('			{');
  slFileXML.Add('				var regExp = new RegExp(inputVal, ''i'');');
  slFileXML.Add('				if(regExp.test($(td).text()))');
  slFileXML.Add('				{');
  slFileXML.Add('					found = true;');
  slFileXML.Add('					return false;');
  slFileXML.Add('				}');
  slFileXML.Add('			});');
  slFileXML.Add('			if(found == true)$(row).show();else $(row).hide();');
  slFileXML.Add('		};');
  slFileXML.Add('		if(allCells.length < 1)');
  slFileXML.Add('		{');
  slFileXML.Add('			var allCells = $(row).find(''th'');');
  slFileXML.Add('			if(allCells.length > 0)');
  slFileXML.Add('			{');
  slFileXML.Add('				var found = false;');
  slFileXML.Add('				allCells.each(function(index, td)');
  slFileXML.Add('				{');
  slFileXML.Add('					var regExp = new RegExp(inputVal, ''i'');');
  slFileXML.Add('					if(regExp.test($(td).text()))');
  slFileXML.Add('					{');
  slFileXML.Add('						found = true;');
  slFileXML.Add('						return false;');
  slFileXML.Add('					}');
  slFileXML.Add('				});');
  slFileXML.Add('				if(found == true)$(row).show();else $(row).hide();');
  slFileXML.Add('			};');
  slFileXML.Add('		};');
  slFileXML.Add('	});');
  slFileXML.Add('}</script>');
  slFileXML.Add('  </body>');
  slFileXML.Add('</html>');
  slFileXML.SaveToFile(TPath.Combine(TPath.GetDirectoryName(Application.ExeName), 'Report') + '_Monatsbericht.html');
  Application.CreateForm(Tfrm_Browser_FullScreen, frm_Browser_FullScreen);
  frm_Browser_FullScreen.Execute(True,'PCM - Manager: Monatsbericht',TPath.Combine(TPath.GetDirectoryName(Application.ExeName), 'Report') + '_Monatsbericht.html');
end;
procedure Drucke_PCM_Manager_Finanzuebersicht(AMonat,AJahr: integer);
var
  slFileXML: TStringList;
  fEinSum,fAusvar,fAusFix: Double;
begin
  slFileXML:= TStringList.Create;
  slFileXML.Add('<!DOCTYPE html>');

  slFileXML.Add('<html>');
  slFileXML.Add('  <head>');
  slFileXML.Add('    <title>PCM - Finanzübersicht</title>');
  slFileXML.Add('    <meta http-equiv="content-type" content="text/html; charset=Windows-1252"/>');
  slFileXML.Add('    <style type="text/css">body {background: #086A87;}');
  slFileXML.Add('		.container-table {margin: auto;	margin-top: calc(8vh - 7px); margin-bottom: calc(8vh - 7px); width: 80vw; min-height: 8vh; display: block; overflow: auto; -moz-box-shadow: 0px 0px 10px #ccc; -webkit-box-shadow: 0px 0px 10px #ccc; border-bottom: solid 5px #93a8d8;}');
  slFileXML.Add('		.container-table {padding: 15px 15px 15px 15px;width: 80%; }');
  slFileXML.Add('		.container-table-background{background-color: white;}');
  slFileXML.Add('		.container-table * {font-family: "Lucida Grande", "Lucida Sans Unicode", Arial, Helvetica, Verdana, sans-serif;}');
  slFileXML.Add('		.container-table h2 {font-size: 20px; font-weight: 100;}');
  slFileXML.Add('		.Report {width: calc(50% - 15px); float: left; text-align: left;}');
  slFileXML.Add('		.Datumuhrzeit {width: calc(50% - 15px); float: right; text-align: right;}');
  slFileXML.Add('		.divider {height: 5px; width: 100%; background-color: #086A87}');
  slFileXML.Add('		#search {outline: none; margin-top: 0px; margin-bottom: 15px;  width: 100%; display: block; border: none; border-bottom: solid 2px #c9c9c9; transition: border 0.3s;}');
  slFileXML.Add('		#search:focus, #search.focus {border-bottom: solid 2px #969696;}');
  slFileXML.Add('		table {width: 100%;border-collapse:collapse; padding: 0px 15px 0px 15px;}');
  slFileXML.Add('		table thead th {padding: 15px 0px 0px 0px;}');
  slFileXML.Add('		table tbody th {border-top: 1px solid black; padding: 5px 0px 0px 0px}');
  slFileXML.Add('		table tfoot th {border-bottom: 5px double black;padding: 20px 0px 0px 0px;}');
  slFileXML.Add('		th {padding-bottom: 5px; text-align: Left}');
  slFileXML.Add('		th.big {padding-bottom: 5px; text-align: Left; width:500}');
  slFileXML.Add('		th.small {padding-bottom: 5px; text-align: right; width:200}');
  slFileXML.Add('		td {padding-top: 1px; padding-bottom: 1px; font-size: 15px;}');
  slFileXML.Add('		.status-fields {float: left; display: flex; flex-wrap: wrap; width: calc( 100% - 20px ); text-align: center; margin: 20px 10px 20px 10px;}');
  slFileXML.Add('		div.status-fields>div {width: calc( 20% - 20px ); display: flex; align-items: center; justify-content: center; flex-direction: column; margin: 5px 5px 5px 5px; padding: 10px 5px 10px 5px; float: left; }');
  slFileXML.Add('		div.status-fields>tr {display: none;} div.status-fields>tr>td {display: none;}');
  slFileXML.Add('		.mobile-hidden {display: none;}</style>');
  slFileXML.Add('  </head>');
  slFileXML.Add('  <body>');
  slFileXML.Add('      <div class="container-table container-table-background">');
  slFileXML.Add('      <div class="Report">');
  slFileXML.Add('        <h2>PCM - Finanzübersicht für ' + GetMonthName(AMonat) + ' ' + IntToStr(AJahr) + '</h2>');
  slFileXML.Add('      </div>');
  slFileXML.Add('      <div class="Datumuhrzeit">');
  slFileXML.Add('        <h2>' + DatetoStr(Date()) + ' - ' + Copy(TimeToStr(Now()),1,5) + ' Uhr</h2>');
  slFileXML.Add('      </div>');
  slFileXML.Add('      <div style="clear: both;">');
  slFileXML.Add('				<input id="search" placeholder="Suchen"/>');
  slFileXML.Add('				<div class="divider">');
  slFileXML.Add('					<div class="status-fields">');
  slFileXML.Add('						<table id="tblData">');
  ////////////////////////////////////////////////////////////////////////////
  // Einnahmen                                                              //
  ////////////////////////////////////////////////////////////////////////////
  slFileXML.Add('							<thead>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th colspan="3">Einnahmen:</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</thead>');
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big">Quelle:</th>');
  slFileXML.Add('									<th class="big">Beschreibung:</th>');
  slFileXML.Add('									<th class="small">Betrag:</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  dm_PCM.qry_work.SQL.Text:= 'SELECT * FROM manager_finanzen_einnahmen where id_benutzer = :id_benutzer order by quelle';
  dm_PCM.qry_work.ParamByName('id_benutzer').AsInteger:= dm_PCM.iIDBenutzerPCM;
  dm_PCM.qry_work.open;
  fEinSum:= 0;
  while not dm_PCM.qry_work.Eof do
  begin
    slFileXML.Add('							<tbody>');
    slFileXML.Add('								<tr>');
    slFileXML.Add('									<th class="big">' + dm_PCM.qry_work.FieldByName('Quelle').AsString + '</th>');
    slFileXML.Add('									<th class="big">' + dm_PCM.qry_work.FieldByName('Bezeichnung').AsString + '</th>');
    slFileXML.Add('									<th class="small">' + Format('%.2f €', [dm_PCM.qry_work.FieldByName('Betrag').AsFloat]) + '</th>');
    slFileXML.Add('								</tr> ');
    slFileXML.Add('							</tbody>');
    fEinSum:= fEinSum + dm_PCM.qry_work.FieldByName('Betrag').AsFloat;
    dm_PCM.qry_work.Next
  end;
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big">Einnahmen gesamt:</th>');
  slFileXML.Add('									<th class="big"> </th>');
  slFileXML.Add('									<th class="small">' + Format('%.2f €', [fEinSum]) + '</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  ////////////////////////////////////////////////////////////////////////////
  // Ausgaben variabel                                                      //
  ////////////////////////////////////////////////////////////////////////////
  slFileXML.Add('							<thead>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th colspan="3">Ausgaben variabel:</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</thead>');
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big">Empfänger:</th>');
  slFileXML.Add('									<th class="big">Beschreibung:</th>');
  slFileXML.Add('									<th class="small">Betrag:</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  dm_PCM.qry_work.SQL.Text:= 'SELECT * FROM manager_finanzen_ausgaben where id_benutzer = :id_benutzer and Gueltig_monat = :Monat and Gueltig_jahr = :Jahr and fixkosten = false order by Name';
  dm_PCM.qry_work.ParamByName('id_benutzer').AsInteger:= dm_PCM.iIDBenutzerPCM;
  dm_PCM.qry_work.ParamByName('Monat').AsInteger:= AMonat;
  dm_PCM.qry_work.ParamByName('Jahr').AsInteger:= Ajahr;
  dm_PCM.qry_work.open;
  fAusvar:= 0;
  while not dm_PCM.qry_work.Eof do
  begin
    slFileXML.Add('							<tbody>');
    slFileXML.Add('								<tr>');
    slFileXML.Add('									<th class="big">' + dm_PCM.qry_work.FieldByName('Name').AsString + '</th>');
    slFileXML.Add('									<th class="big">' + dm_PCM.qry_work.FieldByName('Bezeichnung').AsString + '</th>');
    slFileXML.Add('									<th class="small">' + Format('%.2f €', [dm_PCM.qry_work.FieldByName('Betrag').AsFloat]) + '</th>');
    slFileXML.Add('								</tr> ');
    slFileXML.Add('							</tbody>');
    fAusvar:= fAusvar + dm_PCM.qry_work.FieldByName('Betrag').AsFloat;
    dm_PCM.qry_work.Next
  end;
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big">Ausgaben variabel gesamt:</th>');
  slFileXML.Add('									<th class="big"> </th>');
  slFileXML.Add('									<th class="small">' + Format('%.2f €', [fAusvar]) + '</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  ////////////////////////////////////////////////////////////////////////////
  // Ausgaben Fix                                                           //
  ////////////////////////////////////////////////////////////////////////////
  slFileXML.Add('							<thead>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th colspan="3">Ausgaben fix:</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</thead>');
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big">Empfänger:</th>');
  slFileXML.Add('									<th class="big">Beschreibung:</th>');
  slFileXML.Add('									<th class="small">Betrag:</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  dm_PCM.qry_work.SQL.Text:= 'SELECT * FROM manager_finanzen_ausgaben where id_benutzer = :id_benutzer and  fixkosten = ''true'' order by Name';
  dm_PCM.qry_work.ParamByName('id_benutzer').AsInteger:= dm_PCM.iIDBenutzerPCM;
  dm_PCM.qry_work.open;
  fAusfix:= 0;
  while not dm_PCM.qry_work.Eof do
  begin
    slFileXML.Add('							<tbody>');
    slFileXML.Add('								<tr>');
    slFileXML.Add('									<th class="big">' + dm_PCM.qry_work.FieldByName('Name').AsString + '</th>');
    slFileXML.Add('									<th class="big">' + dm_PCM.qry_work.FieldByName('Beschreibung').AsString + '</th>');
    slFileXML.Add('									<th class="small">' + Format('%.2f €', [dm_PCM.qry_work.FieldByName('Betrag').AsFloat]) + '</th>');
    slFileXML.Add('								</tr> ');
    slFileXML.Add('							</tbody>');
    fAusfix:= fAusfix + dm_PCM.qry_work.FieldByName('Betrag').AsFloat;
    dm_PCM.qry_work.Next
  end;
  slFileXML.Add('              <tbody>');
  slFileXML.Add('								<tr>');
  slFileXML.Add('									<th class="big">Ausgaben fix gesamt:</th>');
  slFileXML.Add('									<th class="big"> </th>');
  slFileXML.Add('									<th class="small">' + Format('%.2f €', [fAusfix]) + '</th>');
  slFileXML.Add('								</tr>');
  slFileXML.Add('							</tbody>');
  slFileXML.Add('							<tfoot>');
  slFileXML.Add('								<tr/>');
  slFileXML.Add('								<th class="big">verfügbare Restsumme:</th>');
  slFileXML.Add('								<th class="big"></th>');
  slFileXML.Add('								<th class="small">' + Format('%.2f €', [fEinSum - fAusfix - fAusvar ]) + '</th>');
  slFileXML.Add('							</tfoot>');
  slFileXML.Add('						</table>');
  slFileXML.Add('					</div>');
  slFileXML.Add('				</div>');
  slFileXML.Add('			</div>');
  slFileXML.Add('    </div>');
  slFileXML.Add('    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>');
  slFileXML.Add('    <script type="text/javascript">$(document).ready(function()');
  slFileXML.Add('{');
  slFileXML.Add('	$(''#search'').keyup(function()');
  slFileXML.Add('	{');
  slFileXML.Add('		searchTable($(this).val());');
  slFileXML.Add('	});');
  slFileXML.Add('});');
  slFileXML.Add('function searchTable(inputVal)');
  slFileXML.Add('{');
  slFileXML.Add('	// Tabellenvariable festlegen');
  slFileXML.Add('	var table = $(''#tblData'');');
  slFileXML.Add('	// Tabelleninhalt Tr finden');
  slFileXML.Add('	table.find(''tr'').each(function(index, row)');
  slFileXML.Add('	{');
  slFileXML.Add('		var allCells = $(row).find(''td'');');
  slFileXML.Add('		if(allCells.length > 0)');
  slFileXML.Add('		{');
  slFileXML.Add('			var found = false;');
  slFileXML.Add('			allCells.each(function(index, td)');
  slFileXML.Add('			{');
  slFileXML.Add('				var regExp = new RegExp(inputVal, ''i'');');
  slFileXML.Add('				if(regExp.test($(td).text()))');
  slFileXML.Add('				{');
  slFileXML.Add('					found = true;');
  slFileXML.Add('					return false;');
  slFileXML.Add('				}');
  slFileXML.Add('			});');
  slFileXML.Add('			if(found == true)$(row).show();else $(row).hide();');
  slFileXML.Add('		};');
  slFileXML.Add('		if(allCells.length < 1)');
  slFileXML.Add('		{');
  slFileXML.Add('			var allCells = $(row).find(''th'');');
  slFileXML.Add('			if(allCells.length > 0)');
  slFileXML.Add('			{');
  slFileXML.Add('				var found = false;');
  slFileXML.Add('				allCells.each(function(index, td)');
  slFileXML.Add('				{');
  slFileXML.Add('					var regExp = new RegExp(inputVal, ''i'');');
  slFileXML.Add('					if(regExp.test($(td).text()))');
  slFileXML.Add('					{');
  slFileXML.Add('						found = true;');
  slFileXML.Add('						return false;');
  slFileXML.Add('					}');
  slFileXML.Add('				});');
  slFileXML.Add('				if(found == true)$(row).show();else $(row).hide();');
  slFileXML.Add('			};');
  slFileXML.Add('		};');
  slFileXML.Add('	});');
  slFileXML.Add('}</script>');
  slFileXML.Add('  </body>');
  slFileXML.Add('</html>');
  slFileXML.SaveToFile(TPath.Combine(TPath.GetDirectoryName(Application.ExeName), 'Report') + '_Finanzübersicht.html');
  Application.CreateForm(Tfrm_Browser_FullScreen, frm_Browser_FullScreen);
  frm_Browser_FullScreen.Execute(True,'PCM - Manager: Finanzübersicht',TPath.Combine(TPath.GetDirectoryName(Application.ExeName), 'Report') + '_Finanzübersicht.html');
  slFileXML.Free;
end;
end.
