/*:
 # Problem 1: Prime Number Checker
 ## Description
 A prime number is a natural number greater than `1` with only two factors, namely `1` and itself. A non-prime natural number greater than `1` is called a composite number.
 */
/*:
 - Example: `5` is a prime number because its only factors are `1` and `5`
 */
isPrime(2)
/*:
 - Example: `4` is a composite number because its factors (`1`, `2`, `4`) include `2`.
 */
/*:
Since a prime number `n` consists of only two factors (`1` and `n`), we must check to see if `n` is divisible by any number greater than 1 or less than n (non-inclusive).
 */
/*:
 ## Pseudocode
 */
/*:
    Function (Input is an Integer) {
        If the input is less than or equal to 1:
            Return false because it doesn't fit the definition
        Else, if the input is divisible by any natural numbers [2, n-1]:
            Return false if the input is divisible by one of them
        Finally, if the code reaches here, then the number must be prime
        Return true
    }
 */
/*:
 ## The Function
 */
import UIKit

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    } else {
        for x in 2..<n {
            if n % x == 0 {
                return false
            }
        }
    }
    return true
}

print(isPrime(2))
print(isPrime(3))
print(isPrime(10))
print(isPrime(13))

/*:
 ## Analysis
 * I decided to choose this problem because I've seen this function written in different languages and I thought it would be a good way to get used to the unfamiliar syntax of Swift. By working through a problem I've seen before, I became more comfortable using this new language.
 * In this function, there's only one constant input called `n`. The function assigns the values [`2`, `n-1`] to a variable named x. It then checks to see if `n` can be evenly divided by `x`. If the input is prime, the function returns true. Otherwise, the function returns false.
 * Variables are names which contain mutable values, whereas constants are names which contain immutable values. We choose constants when we know the value will not change throughout the program. This immutability reduces errors, minimizes memory usage, and creates more readable programs.
 */
