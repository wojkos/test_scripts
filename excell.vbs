Set objExcel = CreateObject("Excel.Application") 
objExcel.Visible = False 
Set objWorkbook = objExcel.Workbooks.Add
Set objWorkSheet = objWorkbook.Sheets.Add
Dim x
For x = 1 To 50
    objWorkSheet.Cells(x,x+1).Value = "new value"
Next
Set objWorkSheet1 = objWorkbook.Sheets.Add
With objWorkSheet1
    .Cells(1, 1) = "Test1"
    .Range("A2:D2") = Array("Steps No", "Test Steps", "Expected Result", "Remarks")
    .Range("A2:D2").Font.Bold = True
End With

dateNow = CDate(Now())	
isoDateStr = CStr(DateDiff("s", "01/01/1970 00:00:00", dateNow))
Dim filePath
filePath = "" & isoDateStr & ".xlsx" 
objWorkbook.SaveAs filePath

objWorkbook.Close 
objExcel.Quit

Set objWorkbook = Nothing

Set objWorkbook = objExcel.Workbooks.Open(filePath)
objWorkbook.WorkSheets(3).Activate
objWorkbook.WorkSheets(3).Cells(1, 1).Value = "after save value"
objExcel.ActiveWorkbook.Save 
objExcel.ActiveWorkbook.Close
objExcel.Application.Quit

Set objWorkSheet = Nothing
Set objWorkSheet1 = Nothing
Set objWorkbook = Nothing
Set objExcel = Nothing
WScript.Quit