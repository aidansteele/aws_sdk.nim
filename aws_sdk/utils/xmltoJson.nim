import packedjson, xmlparser,xmltree
proc transf(x: XmlNode; parent: var JsonTree) =
    proc atomToJson(x: string): JsonNode =
      if x == "true": %true
      elif x == "false": %false
      elif x.allCharsInSet({'0'..'9'}) and x.len < 7: %parseInt(x)
      else: %x
  
    var isArray = 0
    if x.kind == xnElement:
      for c in items(x):
        if c.kind == xnElement and c.tag == "item":
          inc isArray
      if isArray == x.len and isArray > 0:
        var arr = newJArray()
        for c in items(x):
          assert c.kind == xnElement and c.tag == "item"
          transf(c, arr)
        if parent.kind == JArray: parent.add arr
        else: parent[x.tag] = arr
        return
      var txt = ""
      var hasTxt = false
      var isAtom = true
      var obj = newJObject()
      for c in items(x):
        if c.kind in {xnText, xnCData, xnEntity}:
          txt.add c.text
          hasTxt = true
        else:
          transf(c, obj)
          isAtom = false
      if hasTxt:
        obj[x.tag] = atomToJson txt
      if parent.kind == JArray:
        parent.add obj
      elif obj.len == 1 and isAtom:
        # embed it into parent:
        for k, v in obj:
          parent[k] = v
      else:
        parent[x.tag] = obj
  
proc transform*(x: XmlNode): JsonTree =
    result = newJObject()
    transf(x, result)
  
  
proc conv*(x: XmlNode): Future[JsonNode] =
    let res = newFuture[JsonNode]("stuff")
    res.complete(transform(x))
    result = res