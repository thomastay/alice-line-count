# Fast Line Counting with aliceLC

# Comparing Nim and Python equivalents
Run with
```
make compare
```

## Result:

```
### Testing Nim countline ###
/usr/bin/time python3 nim_countlines.py bigfile
7164141
0.28user 0.07system 0:00.36elapsed 99%CPU (0avgtext+0avgdata 1917440maxresident)k
0inputs+0outputs (0major+30958minor)pagefaults 0swaps

### Testing Python countline ###
/usr/bin/time python3 python_countlines.py bigfile
7164141
1.42user 0.18system 0:01.61elapsed 99%CPU (0avgtext+0avgdata 11568maxresident)k
0inputs+0outputs (0major+2128minor)pagefaults 0swaps
```
