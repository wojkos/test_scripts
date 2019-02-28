Set objExcel = CreateObject("Excel.Application") 
objExcel.Visible = False 
Set objWorkbook = objExcel.Workbooks.Add 
objExcel.Cells(3,5).Value = "new value"
objExcel.Cells(3,5).Value = "something different"
dateNow = CDate(Now())	
isoDateStr = CStr(DateDiff("s", "01/01/1970 00:00:00", dateNow))
objWorkbook.SaveAs "C:\Users\Asus\Desktop\Nowyfolder\" & isoDateStr & ".xlsx" 

objWorkbook.Close 
objExcel.Quit

Set objExcel = Nothing
Set objWorkbook = Nothing