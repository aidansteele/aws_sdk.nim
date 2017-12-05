import strtabs

proc mergedTables*(tables: varargs[StringTableRef]): StringTableRef =
  result = newStringTable()
  for table in tables:
    for key, val in table:
      result[key] = val