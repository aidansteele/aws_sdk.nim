# initially copypasted from stdlib cgi.nim
import strutils
import cgi

proc urlencode*(s: string, exception: set[char] = {'-', '.', '_', '~'}): string =
  result = newStringOfCap(s.len + s.len shr 2) # assume 12% non-alnum-chars
  const alphanum = {'a'..'z', 'A'..'Z', '0'..'9'}
  for i in 0..s.len-1:
    let c = s[i]
    if c in alphanum or c in exception:
      add(result, c)
    else:
      add(result, '%')
      add(result, toHex(ord(s[i]), 2))

proc urldecode*(s: string): string = decodeUrl(s)
