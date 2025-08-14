# String Matching Speedtest

A speed test for string matching functions in windows, to see which one is faster.

Contenders:

- `Select-String`
- `findstr`
- `grep` (installed through chocolatey)
- `grep` (WSL / "linux native")

## Files

- `measure_test.ps1`
- `measure_test.sh`
- `fileData1k.csv`
- `fileData1m.csv`
- `test_names.ps1`

## Test-Hardware

```plain$$
CPU = Intel(R) Core(TM) Ultra 7 155H (16C/22T)
RAM = 32GB 8 "Slots" (soldered?) 6400 MT/s
SSD = Micron NVMe 1TB
# Highly unlikely relevant
GPU = NVIDIA GeForce RTX 4060 Laptop GPU
```

## Test-Software

```plain
Microsoft Windows 11 Pro
10.0.26100 N/A Build 26100
Select-String       3.1.0.0
findstr.exe         10.0.26100.1150
grep.exe (GNU grep) 3.11
# WSL
Ubuntu 22.04.5 LTS
grep (GNU grep)     3.7
```

## Windows

### Command

```pwsh
.\measure_test.ps1
```

### Result

```plain
PS C:\Users\flammalpha\tmp> .\measure_test.ps1
Reading TestData
Time to complete: 10.4539514 seconds
Measuring 1000x Select-String 1K
Time to complete: 3.8235561 seconds
Measuring 1000x findstr 1K
Time to complete: 21.3920989 seconds
Measuring 1000x grep 1K
Time to complete: 43.1739563 seconds
Measuring 1x Select-String 1M
Time to complete: 3.9422012 seconds
Measuring 1x findstr 1M
Time to complete: 16.1522328 seconds
Measuring 1x grep 1M
Time to complete: 20.468683 seconds
```

## Linux (WSL)

### Command

```bash
./measure_test.sh
```

### Result

```plain
flammalpha@KINITO:/mnt/c/Users/flammalpha/tmp$ ./measure_test.sh
Timing cat testfile_1k.csv and testfile_1m.csv

real    0m0.312s
user    0m0.124s
sys     0m0.119s

Measuring 1000x grep 1K

real    0m2.004s
user    0m0.721s
sys     0m0.955s

Measuring 1x grep 1M

real    0m0.422s
user    0m0.273s
sys     0m0.147s
```

## References

- [grep for windows](https://github.com/mbuilov/grep-windows)
- [chocolatey](https://chocolatey.org/)
