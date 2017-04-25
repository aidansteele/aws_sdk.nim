import strutils

proc deindent*(inp: string): string =
  result = ""
  for ln in inp.lines:
    result &= strip(ln, trailing = false)
    result &= "\l"
  
proc dehexify*(inp: string): string =
  result = newStringOfCap(toInt(len(inp) / 2))
  var i = 0
  while i < len(inp):
    let hexChar = inp[i..i+1]
    let num = parseHexInt(hexChar)
    add(result, chr(num))
    i += 2