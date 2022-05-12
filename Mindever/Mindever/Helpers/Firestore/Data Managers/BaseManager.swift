import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BaseManager {

    static let database = Firestore.firestore()

    private enum ErrorType: Error {
        case emptyData
        case emptyId
    }

    class func getRecords <T: Decodable> (
        reference: CollectionReference,
        type: T.Type,
        completion: @escaping (Result<[T], Error>) -> Void
    ) {
        reference.whereField("user", isEqualTo: AuthManager.shared.getUserId() ?? "")
            .getDocuments { snapshot, error in
                if let documents = snapshot?.documents {
                    var records: [T] = []
                    for document in documents {
                        do {
                            let record = try document.data(as: T.self)

                            if let record = record {
                                records.append(record)
                            }
                        } catch let error {
                            completion(.failure(error))
                        }
                    }
                    completion(.success(records))
                } else if let error = error {
                    completion(.failure(error))
                }
        }
    }

    class func addRecord <T: Encodable> (
        reference: CollectionReference,
        data: T?,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        guard let data = data else {
            completion(.failure(ErrorType.emptyData))
            return
        }

        do {
            _ = try reference.addDocument(from: data)
            completion(.success(true))
        } catch let error {
            completion(.failure(error))
        }
    }

    class func updateRecord <T: Encodable> (
        reference: CollectionReference,
        id: String?,
        data: T?,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        guard let id = id, let data = data
        else {
            completion(.failure(ErrorType.emptyId))
            return
        }

        let docReference = reference.document(id)
        do {
            try docReference.setData(from: data)
            completion(.success(true))
        } catch let error {
            completion(.failure(error))
        }
    }

    class func deleteRecord(
        reference: CollectionReference,
        id: String?,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        guard let id = id else {
            completion(.failure(ErrorType.emptyId))
            return
        }

        reference.document(id).delete() { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }

}
