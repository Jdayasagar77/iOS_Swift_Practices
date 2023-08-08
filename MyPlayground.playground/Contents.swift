import Foundation
import CryptoKit

//Stored Property

/*
 
class Story {
    var num:Int
 lazy var pi = 3.147
    init(num: Int) {
        self.num = num
    }
}
 
let jungle = Story(num: 9)
jungle.num = 5
jungle.pi = 4
print(jungle.num)
print(jungle.pi)
 
*/
 

// Lazy Stored Property

/*
class Student{
    var name: String
    var num: Int
    init(name: String,num: Int){ // You can observe that classes need initializers but struct don't
        self.name = name
        self.num = num
    }
}

struct Emp {
    let name: String
    let date: String
    lazy var age = Student(name: "Daya", num: 77)
}

var john = Emp(name: "John", date: "jjjj")
print(john)
//print(john.age)
*/

// Factorial

/*
class Facto {
    func fact(num: Int) -> Int {
        var i = 1
        var inum = 1
        while (i<=num){
            inum = inum * i
            i = i+1
        }
        print(inum)
        return inum
    }
}
Facto().fact(num: 4)
*/





// ARC and Memory Management

/*
 
 // Using Weak Reference
class Person1{
    let name: String
    init(name: String) {
        self.name = name
        print("Person1 Memory Allocated")
    }
 //  unowned var daya: Person2?
    weak var daya: Person2?
    deinit{
        print("Person1 Memory Deallocated")
    }
}

class Person2{
    let name: String
    init(name: String) {
        self.name = name
        print("Person2 Memory Allocated")
    }
    var john: Person1?
    deinit{
        print("Person2 Memory Deallocated")
    }
}

var personA: Person1?
personA = Person1(name: "John") // Person A = 1
var personB: Person2?
personB = Person2(name: "Daya") // Person B = 1

personA?.daya = personB // Person B = 2
personB?.john = personA // Person A = 2

personA = nil // if not weak or unowned, Person A = 1
personB = nil // if not weak or unowned, Person B = 1
*/

/*
 
 class Student {
    let name: String
   weak var john: Student?
    init(name: String) {
       self.name = name
 print("\(name) Initiated")
    }
    deinit { print("\(name) Deinitiated") }
 }
var daya: Student?
daya = Student(name: "Daya")
daya?.john = daya
daya = nil
 
*/

/*
 
 
 //Strong Retain Cycles for Closures

// Example 1
 class Human {
    var humanClosure: (()->())?
    var name:String
     init(name: String){
         self.name = name
         humanClosure = {
           [weak self] in
             //[unowned self] in // This will throw an error, find out why...!
            guard let self = self else {
                 return
             }
             
     print("\(self.name) is initialized")
                        }
                }
        deinit {
                print("\(self.name) is deinitialized")
                }
        }

var aot: Human? = Human(name: "Eren Yeager")
print(aot?.name)
aot?.humanClosure!()
aot = nil
//aot?.humanClosure = nil
//aot  = nil
*/

 /*
  
// Example 2
  class Human {
     var name:String
      init(name: String) {
          self.name = name
              print("\(self.name) is initialized")
                         }
                deinit {
                 print("\(self.name) is deinitialized")
                 }
      func closureMe(){
          DispatchQueue.main.asyncAfter(deadline: .now()+5 ){
              [weak self] in
              if let self = self {
                  print("\(self.name) your closure executed now..!!")
              }
          }
      }
}

var daya:Human? = Human(name: "Daya")
daya?.closureMe()
//daya = nil

*/

// Computed Property

/*
struct Circly {
    let radius: Int
    var area: Double {
        get {
            Double(radius*radius)*Double.pi
        }
    }
}

let myGol = Circly(radius: 4)
myGol.area
print(myGol)
print(myGol.area)
*/

/*
class Student {
    var extraMarks = 5
    var eng: Int
    var math: Int
    init(math : Int, englishMarks: Int){
        self.eng = englishMarks
        self.math = math
    }
    var total: Int {
        get{
            eng+math+extraMarks
        }
        set(myMarks){
            self.extraMarks = myMarks
        }
    }
}
let daya = Student(math: 8, englishMarks: 77)
print(daya.total)
daya.total = 100
print(daya.total)
print(daya.extraMarks)
 */

// Property Observers

/*
 
 //For Classes
 
 class Bank {
     var accountBal: Double {
     didSet {
         print("New Value Set Bro : \(accountBal)")
     }
        willSet(myBal){
         if(myBal>=100000){
             print("Bro this is HUGE")
            }
        }
    }
     init(openingBal: Double){
         self.accountBal = openingBal
        }
     func addMoney(amount: Double){
         accountBal = accountBal + amount
     }
 }
  
let mySBI = Bank(openingBal: 20000)
mySBI.addMoney(amount: 100000)
 
 */
 
/*
 // For structs

struct Bank {
    var accountBal: Double {
        didSet {
            print("New Value Set Bro : \(accountBal)")
        }
        willSet(myBal){
            if(myBal>=100000){
                print("Bro this is HUGE")
            }
        }
    }// Notice all the difference between classes and struct scenarios, mutating,var and let constant for objects
  mutating  func addMoney(amount: Double){
        accountBal = accountBal + amount
    }
}

var mySBI = Bank(accountBal: 50000000)
mySBI.addMoney(amount: 3000)
mySBI.accountBal = 30000000

*/

/*
 // Delegation using Protocols
 
 protocol BringDelivery{
 func startBike(food: String)
 }
 class Customer {
 var myOrder: BringDelivery?
 }
 class SwiggyBhaiyya: BringDelivery {
 func startBike(food: String) {
 print("Bike Started and Delivered \(food)..!!")
 }
 }
 
 let daya = Customer()
 let john = SwiggyBhaiyya()
 daya.myOrder = john
 daya.myOrder?.startBike(food: "Chiken Tandoori")
 
*/

/*
 
 // Call Back, Closures
func myOrder(food : String, completion: (String)->()) {
     if food == "Chicken" {
         completion("Chicken is Delivered")
     } else {
         completion("I will not Deliver Order")
     }
 }

func myReturnOrder(food: String, completion: ()->(String)){
  print(completion())
}

myOrder(food: "Chicken") { chick in
    print(chick)
}
myOrder(food: "Hatred") { chick in
    print(chick)
}

myReturnOrder(food: "Mutton") {
    
    return "Mutton is not available Bro..!!"
}
/*
 Important to understand:
 (String)->() // takes a String returns void
 ()->(String) // takes void returns a String
*/

*/


 
// map, flatMap, compactMap, $0 $1, final, Switch Case
 
/*
 
let original = [["Hello", "world"], ["This", "is", "a", "nested", "array"]]
var  original2 = ["Yo bro..!!!",nil,"", " ", nil]

let joined = original.map { item in
  return item.joined(separator: " ")
}

let mapped = original.map { org in
    
    return " Word = \(org)"
}
let mapped2 = original2.map { org in
    return " Word = \(String(describing: org))"
}
let mapped3 = original2.map {
    $0?.uppercased()
}
let dollarVar = ["This", "is", "a", "nested", "array"]
print(dollarVar.sorted { $0 > $1 })
print(dollarVar.sorted { $0.lowercased() < $1.uppercased()})

let comMapped = original2.compactMap { johnWick in
    return johnWick
}
let comMapped2 = original2.compactMap { johnWick in
    johnWick?.isEmpty
}
let flatMapped = original.flatMap { item in
  return item
}
let flatMapped2 = original.flatMap { item in
  item.joined(separator: " ")
}
//print(comMapped)
//print(comMapped2)
//print(flatMapped)
//print(flatMapped2)
//print(mapped)
//print(mapped3)
 
 //static: used for properties or functions of class or struct and can be accessed by class/struct //level. With static keyword, we cannot override.
 //final: used for class and class members (properties or functions). With final keyword, we //cannot override.
 
 final class JohnWick {
     var name:String?
     final var oldName = "Dayasagar"
     init(name: String){
         self.oldName = name
     }
 }
 
 final class Student
 //: JohnWick
 //Error inheritence not possible
 {
     var name: String
     init(name: String) {
         self.name = name
     }
     var dj:JohnWick? = JohnWick(name: "Yo..Yo..")
 }

 let john = JohnWick(name: "DJ")
 john.name = "Michael"
 print(john.name)
 print(john.oldName)
 let dj = Student(name: "John Wick")
 print(dj.dj?.oldName)
 
 
 let ageGroup = 33

 switch ageGroup {
   case 0...16:
     print("Child")

   case 17...30:
     print("Young Adults")

   case 31...45:
     print("Middle-aged Adults")

   default:
     print("Old-aged Adults")
 }
 
*/

// All in One Program

/*
final class YoStudent {
    var name:String?
    let allAngels = ["Archangel","Seraphs","Cherubs","Myriads","Messengers","Dayasagar","77",nil,""]
    var mapped : [Any]?
    final var oldName = "Dayasagar"
    init(name: String){
        self.oldName = name
    }
    func myNameis() -> () {
        switch self.name {
        case nil:
           return print("This Person is Absent Sir")
        case "DJ":
            return print("This Person is idiot Sir")
//
//        case "Dayasagar":
//            return print("\(String(describing: name))is Present sir") it counts the first case if found same
        case allAngels[0]:
            self.mapped = allAngels.map({ angel in
                return "Jesus is the Archangel"
            })
            return print(self.mapped as Any)
        case allAngels[1]:
            self.mapped = allAngels.map({
                $0?.uppercased() as Any
            })
            return print(self.mapped as Any)
        case allAngels[2]:
            self.mapped = allAngels.sorted(by:{ $0?.lowercased() ?? "Sparrow" < $1?.uppercased() ?? "Jack" } ) as [Any]
            return print(self.mapped as Any)
        case allAngels[3]:
            self.mapped = allAngels.sorted { $0 ?? "" > $1 ?? "" } as [Any]
            return print(self.mapped as Any)
        case allAngels[4]:
            self.mapped = allAngels[0]?.cString(using: .unicode)
            return print(self.mapped as Any)
        case allAngels[5]:
            self.mapped = allAngels.compactMap({ angel in
                return angel
            })
            return print(self.mapped as Any)
        case allAngels[6]:
            self.mapped = allAngels.compactMap({       $0?.isEmpty     })
            return print(self.mapped as Any)
        case allAngels[8]:
            return print("I am NIL brooooo....!!!")

        default:
            return print("All are Absent Sir")
        }
    }
}

let tyler = YoStudent(name: "Durden")

tyler.name = "Dayasagar"
tyler.myNameis()
tyler.name = "Archangel"
tyler.myNameis()
tyler.name = "Seraphs"
tyler.myNameis()
tyler.name = "Cherubs"
tyler.myNameis()
tyler.name = "Myriads"
tyler.myNameis()
tyler.name = "Messengers"
tyler.myNameis()
tyler.name = "77"
tyler.myNameis()
tyler.name = ""
tyler.myNameis()

*/


/*
 
struct Person: CustomStringConvertible {
    
     let name: String
     var description: String {
         print("Asking for Person description.")
         return "Person name is \(name)"
     }
    
 }

let isDebuggingEnabled: Bool = true

 func debugLog(_ message: @autoclosure () -> String) {
     /// You could replace this in projects with #if DEBUG
     if isDebuggingEnabled {
         print("[DEBUG] \(message())")
     }
 }

 let person = Person(name: "Bernie")
//debugLog({ person.description })
debugLog(person.description)
 
*/


/*

func triArea(l: Int, b: Int) -> Int{
    let area = (l*b)/2
    return area
}

print(triArea(l: 3, b: 2))

func factoFor(num: Int) -> Int {
    var i = 1
    var k = 1
    if num > i {
        for j in 1...num {
            k = j*k
            i = i+1
        }
    }
    return k
}
print(factoFor(num: 5))

*/



/*

typealias Psycho = [[Int:String]]

extension Psycho {
    static var uniquePersonality = "Introvertness"
    }

enum Family {
    case Manohar(daya: Psycho), Nandhlal, Benedict, Srikanth
}

var meee: Array<[Int:String]> = [
    [1:"Tyler Durden"],[0:"Joker"],[-1:"Aparichit"],[-2:"Yuuichi"]
]

var hospital = Family.Manohar(daya: meee )

//hospital = Family.Benedict //: Notice the difference

switch hospital {

case .Manohar(daya: let daya):
    print(daya)
    print(Psycho.uniquePersonality)
    print(Psycho())
case .Nandhlal:
    print("Nope")
case .Benedict:
    print("Nope")
case .Srikanth:
    print("Nope")
    
}

*/


/*
 class Videogame {
 
 var title:String
 var published:String
 var rating:Double
 init (title:String, published:String, rating:Double) {
 self.title = title
 self.published = published
 self.rating = rating
 print(title," ",published," ",rating)
 }
 }
 
 let cyberpunk1 = Videogame(title: "King77", published: "DJ", rating: 7.7)
 let cyberpunk2 = Videogame(title: "Servant77", published: "DJ", rating: 7.7)
 let cyberpunk3 = Videogame(title: "Sorry77", published: "DJ", rating: 7.7)
 let cyberpunk4 = Videogame(title: "Servant77", published: "DJ", rating: 7.7)
 
 var myDictionary: [Int:Videogame] = [1:cyberpunk1,
 2:cyberpunk2,
 3:cyberpunk3,
 4:cyberpunk4
 ]
 var myArray = [cyberpunk1,cyberpunk2,cyberpunk3,cyberpunk4]
 var mySet: Set = ["Sets require Hashable Elements", "DJ", "DJ"]
 var myTuple = (mySet, (myDictionary, myArray))
 print(myTuple.1)

 */



// Type Casting, Type Erasure, Optional Binding and Optional Chaining

/*
 
 
 protocol Printable {
 func printMe()
 }
 
 class Animal: Printable {
 var name: String
 var myDog: Dog?
 
 init(name: String) {
 self.name = name
 }
 
 func printMe() {
 print("I'm a Animal")
 }
 
 func makeSound() {
 print("\(self.name) sound")
 }
 
 }
 
 class Dog: Animal {
 
 override func makeSound() {
 print("Woof")
 }
 
 override func printMe() {
 print("I'm a Dog")
 }
 
 func obeyCommand(command: String?){
 guard let command = command else {
 print("Command Not Given.. Idiot..!!!")
 return
 }
 print("Okay, I will follow your command to \(command)")
 }
 }
 
 // Type Casting
 
 let dog = Dog(name: "Fido")
 let myAnimal1: Animal = dog // Upcasting
 
 //print(myAnimal1.name) // Output: Fido
 //myAnimal1.makeSound() // Output: Woof
 
 let animal2 = Animal(name: "Generic animal")
 
 let animals:[Animal] = [myAnimal1,animal2,dog]
 
 for animal in animals{
 if let dog = animal as? Dog { // Downcasting, binding also availabe
 dog.makeSound()
 } else {
 animal.makeSound()
 }
 
 }
 
 //Optional Chaining and Binding
 
 var myBreed: Animal?
 myBreed = Animal(name: "German Sheaperd")
 myBreed?.myDog = dog
 myBreed?.makeSound()
 print(myBreed?.myDog?.name) // Chaining
 
 myBreed?.myDog?.obeyCommand(command: nil) // Binding
 
 
 // Type Erasure
 struct PrintableBox<T: Printable> {
 let value: T
 
 init(_ value: T) {
 self.value = value
 }
 
 func printValue() {
 value.printMe()
 }
 }
 
 let box = PrintableBox(animal2) // Try all instances: dog, animal2, myAnimal
 box.printValue()
 
 */



/*
protocol Sound {
    func makeSound()
}

protocol Flyable {
    func fly(name: String)
}

extension Flyable {
    func fly(name: String) {
        print("\(name) can fly")
    }
}

extension Sound {
    func makeSound() {
        print("Ammaaazzzziiiiinnnnnnggggggg...")
    }
}

class Pigeon: Sound, Flyable {
    
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func printName() -> Self { // This Self represents a Type
        defer { print("\(self.name)") }
        defer { print("is") }
        defer { print("name") }
        print("My")
        return self // This self represents instance and is returning the type Pigeon
    }

}


let titleKeyPath = \Pigeon.name

let pigeon = Pigeon(name: "Aura")

pigeon.fly(name: pigeon[keyPath: titleKeyPath])
pigeon.makeSound()
print(pigeon.printName())
*/
