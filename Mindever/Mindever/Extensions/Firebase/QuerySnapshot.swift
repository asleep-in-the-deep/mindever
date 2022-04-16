import Foundation
import FirebaseFirestore

extension QuerySnapshot {

    func decoded <T: Decodable> (type: T.Type) throws -> [T] {
        let objects: [T] = try documents.map { try $0.decoded(type: T.self) }
        return objects
    }
}

extension QueryDocumentSnapshot {

    func decoded <T: Decodable> (type: T.Type) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(type.self, from: jsonData)
        return object
    }
}
