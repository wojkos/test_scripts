Set objExcel = CreateObject("Excel.Application") 
objExcel.Visible = False 

' Create file
Dim i
For i = 1 to 3
    Set objWorkbook = objExcel.Workbooks.Add
    Set objWorkSheet = objWorkbook.Sheets.Add
    Dim x
    For x = 1 To 20
        objWorkSheet.Cells(i,x+1).Value = x
    Next
    Set objWorkSheet1 = objWorkbook.Sheets.Add
    With objWorkSheet1
        .Cells(1, 1) = "Test1"
        .Range("A2:D2") = Array("Steps No", "Test Steps", "Expected Result", "Remarks")
        .Range("A2:D2").Font.Bold = True
    End With
    objWorkbook.SaveAs("C:\Users\Asus\Desktop\Nowyfolder\new_file"& i &".xlsx")
    objWorkbook.Close 
    Set objWorkSheet = Nothing
    Set objWorkSheet1 = Nothing
    Set objWorkbook = Nothing
Next

' Copy from one file to other
Set file1 = objExcel.Workbooks.open("C:\Users\Asus\Desktop\Nowyfolder\new_file1.xlsx")
Set file2 = objExcel.Workbooks.open("C:\Users\Asus\Desktop\Nowyfolder\new_file2.xlsx")
Set file3 = objExcel.Workbooks.open("C:\Users\Asus\Desktop\Nowyfolder\new_file3.xlsx")
Set sheet_new1 = file1.sheets.Add
Set sheet_new2 = file1.sheets.Add
sheet_new1.name = "File2_copy"
sheet_new2.name = "File3_copy"
Set sheet_new1 = Nothing
Set sheet_new2 = Nothing

file2.Worksheets("Sheet1").usedrange.copy
file1.Worksheets("File2_copy").usedrange.pastespecial
file2.Close
Set file2 = Nothing
file3.Worksheets("Sheet1").usedrange.copy
file1.Worksheets("File3_copy").usedrange.pastespecial
file3.Close
Set file3 = Nothing
file1.Save
file1.Close
Set file1 = Nothing

objExcel.Quit
Set objExcel = Nothing
WScript.Quit