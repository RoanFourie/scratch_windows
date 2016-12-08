'A script to update an xlsx report in the background
'The data comes from a csv file
'The excel file have two sheets, one with the report and the other with the raw data
Dim objXLApp, objXLWb, objXLWs
Dim xl, wb, ws

'Open the relevant files
csvfile = Wscript.Arguments(0) 
xlsfile = Wscript.Arguments(1) 

Set xl = CreateObject("Excel.Application")
xl.Visible = False  'set to False for production

Set wb = xl.Workbooks.Open("C:\path\to\some.xlsx")




'clear the second worksheet

'Read the csv file into the second worksheet

'Select the first sheet

'Refresh the report


'Save the file
wb.Save

'Exit and release the file
wb.Close
objXLWb.Close (False)
Set objXLWs = Nothing
Set objXLWb = Nothing

xl.Quit
objXLApp.Quit
Set objXLApp = Nothing




