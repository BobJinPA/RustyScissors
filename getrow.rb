
=begin
'@Description Get information about a  specified row in table
'@Documentation Select a table row that matches the parameters in the associated parameter table (for <*>, treat as wildcard). Depending on verification type value, expect the row to exist or not.
Function GetTableRow_Extended_WebTable(obj, intStartingRow, strColumns, intRowToIgnore,vParameterName, vColumnName)
   If intRowToIgnore = "" Then
	   intRowToIgnore = "-1"
	End If
	GetTableRow_Extended_WebTable = -1
	Set d = CreateObject("Scripting.Dictionary")
	arrColumns = split(strColumns, ";")
	intNumberOfParms = UBound(arrColumns) + 1
	For intColumnLoop = 0 to (intNumberOfParms - 1)
		strMyColumn = Trim(Replace(arrColumns(intColumnLoop),"_", " "))
		strUnchangedMyColumn = strMyColumn
				'-------------------------------
				'Exception case
				If vParameterName <> "<SKIP>" Then
					arrParameterName = Split(vParameterName, ";")
					arrColumnName = Split(vColumnName, ";")
					For i = 0 To uBound(arrParameterName)
						If strMyColumn = Replace(arrParameterName(i),"_", " ") Then
							strMyColumn = arrColumnName(i)
						End If
					Next
				End If
				'End Exception case
				'-------------------------------

		d.Add strUnchangedMyColumn,GetTableColumnNumber_WebTable(obj, intStartingRow, strMyColumn)
	Next
	blnFoundIt = False
	intMatchCount = 0
	intRowCount = obj.RowCount
	For intRowLoop = intStartingRow + 1 to (intRowCount )
		If intRowLoop <> CInt(intRowToIgnore) Then
			intReturn = 1 'initialize to 0. do for each row
			For intColumnLoop = 1 to (intNumberOfParms)
				strMyColumn = Trim(arrColumns(intColumnLoop-1))' single column from parameter
				strExpectedVal = Parameter(strMyColumn) 'get parameter value
				intColNum=d.Item(Replace(strMyColumn,"_", " ")) 'may return -1 if column does not exist
				If intColNum <> -1 Then
					strActualVal = Trim(obj.GetCellData(intRowLoop, intColNum))'get actual value
					If RegExpTest(Trim(strExpectedVal), Trim(strActualVal)) or (strExpectedVal = "<*>") or (strExpectedVal = "<SKIP>") Then 'evaluate the outcome
						intReturn = intReturn * True
					Else
						intReturn = intReturn * False
					End If
				Else 'column does not exist
					If (strExpectedVal <> "<*>") and (strExpectedVal <> "<SKIP>") Then 'the expected is valued with a real value and this is bad
						Reporter.ReportEvent micFail, "Column With Expected Value Does Not Exist", "Stopping test.  Column '" & Replace(strMyColumn,"_", " ") & "' does not exist.  Expected value is: " & strExpectedVal
						ExitComponentIteration
					End If
				End If
			Next 'intColumnLoop
			'finished looking at all the columns. Now see if this row is a true match or not.
			If intReturn <> 0Then 'all true
				If blnFoundIt = False Then 'this makes sure that things happen to the first instance only
					blnFoundIt = True
'					Parameter("FirstRowMatch_out") = (intRowLoop) - intStartingRow 'make the first matching row number match the apparent value on the page, 1 based
					GetTableRow_Extended_WebTable = intRowLoop
					'write output values
					For intWriteOutput = 0 to intNumberOfParms -1
						strParmName = arrColumns(intWriteOutput)
						strParmName = Replace(strParmName,"_", " ")

						intColNum=d.Item(strParmName)
						If intColNum <> -1 Then
							Parameter(arrColumns(intWriteOutput) & "_out")= obj.GetCellData(intRowLoop, intColNum)
						Else
							Parameter(arrColumns(intWriteOutput) & "_out")="<Column Does Not Exist>"
						End If
					Next 'intWriteOutput
				End If
				intMatchCount = intMatchCount + 1
			End if
		End If
	Next 'intRowLoop
	'make a concatenated list of input parmeter values
	strTestLabel = "Search for Row: "
	For intTestLabelValues = 1 to intNumberOfParms
		strTestLabel = strTestLabel & Parameter(arrColumns(intTestLabelValues-1)) & ", "
	Next 'intTestLabelValues
	strTestLabel = Mid(strTestLabel, 1, Len(strTestLabel) -2) 'trim off the final ", "
	If AssertEqual(strTestLabel, UCase(CStr(blnFoundIt)), UCase(CStr(Parameter("VerificationType")))) = False Then
		TakeSnapshot(obj)
	End If
	Parameter("TotalMatchCount_out") = intMatchCount
	Set d=Nothing
End Function
=end
