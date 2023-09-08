/*:
  [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 # A Throwing Function
 functions or methods that might generate an error
 */
import Foundation

//func validateCredentials(username: String, password: String) throws {
//    // You might have some logic here that will check to see if
//    // the username and/or password fullfill your requirements
//}
//validateCredentials(username: "dayasagar", password: "Sigma@77")
/*:
 ## Error Enum
 Throwing functions can have an associated enum error
 */
enum CredentialsError: Error {
    case wrongUsername, wrongPassword
}
func validateCredentials(username: String, password: String) throws {
    if username.count < 4 {
        throw CredentialsError.wrongUsername
    }
    if password.rangeOfCharacter(from: .decimalDigits) == nil {
        throw CredentialsError.wrongPassword
    }
    print("Passed")
}

//try validateCredentials(username: "daya", password: "sigma")
/*:
 ## Try
 Use in a do - try - catch block when you want to deal with specific types of errors
 */
do {
    try validateCredentials(username: "day", password: "Sigma")
}
catch {
    switch error {
    case CredentialsError.wrongUsername:
        print("Username is too short")
    case CredentialsError.wrongPassword:
        print("Password does not contain a decimal number")
    default:
        break
    }
}
/*:
 ## Try?
 */
func login(username: String, password: String){
    guard (try? validateCredentials(username: username, password: password)) != nil else {
        print("Failed")
        return
    }
    print("Successful Credentials")
}

login(username: "day", password: "sigma77")
