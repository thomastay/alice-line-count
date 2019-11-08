import memfiles
import os
import nimpy

# Adapted from the Nim standard library
proc countLines*(filename: string): int {.exportpy.} =
  proc c_memchr(cstr: pointer, c: char, n: csize): pointer {.
       importc: "memchr", header: "<string.h>".}
  proc `-!`(p, q: pointer): int {.inline.} = return cast[int](p) -% cast[int](q)
  let mfile = memfiles.open(filename)
  var ms: MemSlice
  var ending: pointer
  ms.data = mfile.mem
  var remaining = mfile.size
  while remaining > 0:
    ending = c_memchr(ms.data, '\n', remaining)
    if ending == nil: # unterminated final slice
      break
    ms.data = cast[pointer](cast[int](ending) +% 1) # skip delim
    remaining = mfile.size - (ms.data -! mfile.mem)
    inc result

when declared(paramStr):
  echo countLines(paramStr(1))
