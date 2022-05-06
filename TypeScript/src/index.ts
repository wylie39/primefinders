function isPrime(n: number): boolean {
	if (n <= 1) {
		return false
	} else {
		let i: number = 2
		while (i < n) {
			if (n % i === 0) {
				return false
			}
			i++
		}
	}
	return true
}
const  primes = process.argv[2] || 100
let found: number = 0
let i = 0
while (found != primes) {
    if(isPrime(i)){
        console.log(i)
        found++
    }
    i++
    
}
