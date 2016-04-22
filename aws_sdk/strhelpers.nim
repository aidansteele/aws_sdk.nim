import nre
import sequtils
import strutils

proc deindent*(inp: string): string =
  let indents = findAll(inp, re"(?m)^[ \t]+")
  let maxSize = max(mapIt(indents, len(it)))
  let regex = re("(?m)^[ \\t]{$1}" % intToStr(maxSize))
  result = replace(inp, regex, "")
  
proc dehexify*(inp: string): string =
  result = newStringOfCap(toInt(len(inp) / 2))
  var i = 0
  while i < len(inp):
    let hexChar = inp[i..i+1]
    let num = parseHexInt(hexChar)
    add(result, chr(num))
    i += 2