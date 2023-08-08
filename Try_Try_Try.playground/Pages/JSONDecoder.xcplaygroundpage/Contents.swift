/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 # Decodable

*/
import UIKit

let person1JSON = """
{
    "name": "James",
    "age": 45,
}
"""


struct Person: Decodable {
    var name: String
    var age: Int
}

let decoder = JSONDecoder()
let person1JSONData = person1JSON.data(using: .utf8)!
//let person = try decoder.decode(Person.self, from: person1JSONData)
//print(person)
/*:
 ## Try!
 */
//let person = try! decoder.decode(Person.self, from: person1JSONData)
//print(person) // Will through an error if data is corrupted

/*:
 ## do try catch
 */
//do {
//    let person = try decoder.decode(Person.self, from: person1JSONData)
//    print(person)
//} catch {
//    print(error.localizedDescription)
//}
/*:
 ## Try?
 */
let person = try? decoder.decode(Person.self, from: person1JSONData)
//if let person = person {
//    print(person)
//}else {
//    print("There exists some error")
//}

print(person ?? Person(name: "Dayasagar", age: 77))


/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
