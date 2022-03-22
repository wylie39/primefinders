proc main {n start} {
   puts "Start"
   set fp [open ./results.txt w]
   close $fp
   set startTime [clock clicks -milliseconds]
   primes $n $start
   puts "Done in [expr [expr [clock clicks -milliseconds] - $startTime] / 1000] Seconds"
}

proc primes {num start} {
    set primeCandidate $start
    set primeCount 0
    while {$primeCount != $num} {
        set TIME_start [clock clicks -milliseconds]
        if {[isPrime $primeCandidate]} {
            set TIME_taken [expr [clock clicks -milliseconds] - $TIME_start]
            set fp [open ./results.txt a+]
            puts $fp $primeCandidate
            close $fp
            set primeCount [expr {$primeCount + 1}]
            puts \x1b\[H\x1b\[2J
            puts "Found:$primeCount of $num is $primeCandidate in $TIME_taken milliseconds"
            puts "[expr [expr $TIME_taken * ($num - $primeCount)] / 1000] Seconds left"
        }
        set primeCandidate [expr {$primeCandidate + 1}]
    }
}

proc isPrime {n} {
    if {$n <= 1} {
        return false
    } else {
        set i 2
        while {$i < $n } {
            if {$n % $i == 0 } {
                return false;
            }
            set i [expr {$i + 1}]
        }
    }
    return true
}

main 10 10000000000
