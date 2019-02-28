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
objWorkbook.SaveAs "C:\Users\Asus\Desktop\Nowyfolder\" & isoDateStr & ".xlsx" 

objWorkbook.Close 
objExcel.Quit

Set objExcel = Nothing
Set objWorkbook = Nothing
