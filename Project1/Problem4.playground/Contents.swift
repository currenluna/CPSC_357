/*:
 # Problem 4: Email Validation
 ## Description
 Email forms commonly check for valid email addresses. A valid email address incluldes the following elements.
 */
/*:
 - Callout(Email Format): `text1`, `"@"`, `text2`, `"."`, `text3`
 */
/*:
 - Example: `"ctaber@chapman.edu"` is a valid email address
 */
/*:
 - Example: `"not an email"` is not a valid email address
 */
/*:
 Using these specifications, we want to write a function that returns `text1` (the email user's name) when provided with valid email address inputs. The function will request a new email for invalid email address inputs.
 */
/*:
 ## Pseudocode
 */
/*:
    Function (Input is a String) {
        Initialize a constant representing the first index of "@"
        Initialize a constant representing the first index of "."
        If the following are true...
            1. The input contains a "@" and ".", but no spaces
            2. The input meets the minimum possible length (5)
            3. (Index of "@") minus (Starting Index) is greater than 1
            4. (Index of ".") minus (Index of "@") is greater than 1
            5. (Ending Index) minus (Index of ".") is greater than 1
                Return "Thanks for the email, (Text1/Name)"
        Else
            Return "Provide a valid email"
    }
 */

import UIKit

func verifyEmailAddress(_ address: String) -> String {
    let indexAt: String.Index? = address.firstIndex(of: "@")
    let indexPeriod: String.Index? = address.firstIndex(of: ".")
    let indexSpace: String.Index? = address.firstIndex(of: " ")
    let errorMessage: String = "Provide a valid email address."
    
    if indexAt == nil || indexPeriod == nil || indexSpace != nil {
        return errorMessage
    } else if address.count < 5 {
        return errorMessage
    } else {
        if address.distance(from: address.startIndex, to: indexAt!) > 1
            && address.distance(from: indexAt!, to: indexPeriod!) > 1
            && address.distance(from: indexPeriod!, to: address.endIndex) > 1 {
            return "Thanks for your email, \(address[address.startIndex..<indexAt!].capitalized)."
        } else {
            return errorMessage
        }
    }
}

print(verifyEmailAddress("cibrian@chapman.edu"))
print(verifyEmailAddress("hipjasif@gmail.com"))
print(verifyEmailAddress("thisisnot an email"))
print(verifyEmailAddress("cibrien.edu"))

/*:
 ## Analysis
 * I decided to choose this problem because I wasn't sure how to approach this problem at first and I thought it would be a fun challenge..
 * This function takes a String input and sets three constants (indexAt, indexPeriod, and indexSpace) representing a certain index in the email address. Additionally, another constant gets initialized with an error message. By comparing the values of each index constant, the function determines if the input represents a valid email address. The function returns a string containing Text1/Name if it receives a valid email address.
 * Variables are names which contain mutable values, whereas constants are names which contain immutable values. We choose constants when we know the value will not change throughout the program. This immutability reduces errors, minimizes memory usage, and creates more readable programs.
 */
