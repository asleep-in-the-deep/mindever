import Foundation
import FirebaseFirestore

final class ExampleManager: BaseManager {

    class func getSituations(completion: @escaping (Result<[String], Error>) -> Void) {
        self.database.collection(Collection.examples).document(Document.ru).collection(Collection.situations).getDocuments { snapshot, error in
            if let documents = snapshot?.documents {
                var situations: [String] = []

                for document in documents {
                    let data = document.data()
                    let text = data["text"] as? String ?? ""
                    situations.append(text)
                }

                completion(.success(situations))
            } else if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
