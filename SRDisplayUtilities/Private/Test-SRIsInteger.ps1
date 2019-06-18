filter Test-SRIsInteger() {
    return $_ -is [byte]  -or $_ -is [int16]  -or $_ -is [int32]  -or $_ -is [int64]  `
       -or $_ -is [sbyte] -or $_ -is [uint16] -or $_ -is [uint32] -or $_ -is [uint64]
}