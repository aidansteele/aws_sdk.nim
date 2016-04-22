import strtabs
import uri
import strutils
import sequtils
import urlencode
import algorithm

proc queryParams*(uri: Uri): StringTableRef =
  var tab = newStringTable()
  for pair_str in split(uri.query, "&"):
    let pair = mapIt(split(pair_str, "="), urldecode(it))
    let key = pair[0]
    let val = pair[1]
    tab[key] = val
  result = tab
  
proc setQueryParams*(uri: var Uri, params: StringTableRef) =
  let unsorted = toSeq(pairs(params))
  let tuples = sortedByIt(unsorted, it.key)
  let keyvals = mapIt(tuples, "$1=$2" % [urlencode(it.key), urlencode(it.value)])
  uri.query = join(keyvals, "&")