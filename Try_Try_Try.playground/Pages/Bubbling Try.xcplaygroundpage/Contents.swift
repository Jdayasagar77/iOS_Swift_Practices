/*:
 [< Previous](@previous)           [Home](Introduction)

 # Bubbling Try
Defer the catching of an error to the calling function

*/
import UIKit

let person2JSON = """
{
    "name": "Jack",
    "age": 45,
}
"""

class Person: ObservableObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case name, age
    }
    var name: String
    @Published  var age: Int
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        do {
//            name = try container.decode(String.self, forKey: .name)
//        }catch {
//
//            fatalError("In Initializer")
//
//        }
//        do {
//            age = try container.decode(Int.self, forKey: .age)
//        }
//        catch {
//            fatalError("In Initializer")
//
//        }
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)

    }
}

let decoder = JSONDecoder()
let person2JSONData = person2JSON.data(using: .utf8)!

var person: Person
    
    do {
        person =  try decoder.decode(Person.self, from: person2JSONData)
        print(person.name)
    }
    catch {
     //   fatalError("Outside Initializer")
        print("Dayasagar is here..!")
    }
//:  [< Previous](@previous)           [Home](Introduction)
