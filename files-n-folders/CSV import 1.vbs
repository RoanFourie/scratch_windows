srccsvfile = Wscript.Arguments(0) 
tgtxlsfile = Wscript.Arguments(1) 

'Create Spreadsheet
'Look for an existing Excel instance.
On Error Resume Next ' Turn on the error handling flag
Set objExcel = GetObject(,"Excel.Application")
'If not found, create a new instance.
If Err.Number = 429 Then '> 0
Set objExcel = CreateObject("Excel.Application")
End If

objExcel.Visible = false
objExcel.displayalerts=false

'Import CSV into Spreadsheet
Set objWorkbook = objExcel.Workbooks.open(srccsvfile)
Set objWorksheet1 = objWorkbook.Worksheets(1)

'Save Spreadsheet, 51 = Excel 2007-2010 
objWorksheet1.SaveAs tgtxlsfile, 51

'Release Lock on Spreadsheet
objExcel.Quit()
Set objWorksheet1 = Nothing
Set objWorkbook = Nothing
Set ObjExcel = Nothing