import Foundation
import FirebaseFirestore

class BaseManager {

    static let database = Firestore.firestore()

    class func getRecords <T: Decodable> (
        reference: CollectionReference,
        type: T.Type,
        completion: @escaping (Result<[T], Error>) -> Void
    ) {
        reference.getDocuments { snapshot, error in
            if let documents = snapshot?.documents {
                do {
                    let records: [T] = try documents.map { try $0.decoded(type: T.self) }
                    completion(.success(records))
                } catch let error {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    class func addRecord(
        reference: CollectionReference,
        data: [String : Any]?,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        guard let data = data else { return }
        
        reference.addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }

}
