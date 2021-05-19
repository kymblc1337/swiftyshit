import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String
    @NSManaged public var sex: String
    @NSManaged public var height: Int32
    @NSManaged public var weight: Int32

}
