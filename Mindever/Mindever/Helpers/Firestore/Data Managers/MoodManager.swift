import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class MoodManager: BaseManager {

    class func getSleep(completion: @escaping (Result<[SleepRecord], Error>) -> Void) {
        let reference = self.database.collection(Collection.sleep)

        self.getRecords(reference: reference, type: SleepRecord.self) { result in
            completion(result)
        }
    }

    class func getMoods(completion: @escaping (Result<[MoodRecord], Error>) -> Void) {
        let reference = self.database.collection(Collection.mood)

        self.getRecords(reference: reference, type: MoodRecord.self) { result in
            completion(result)
        }
    }

    class func addSleep(with sleep: SleepRecord, completion: @escaping (Result<Bool, Error>) -> Void) {
        let reference = self.database.collection(Collection.sleep)
        
        self.addRecord(reference: reference, data: sleep) { result in
            completion(result)
        }
    }

    class func addMood(with mood: MoodRecord, completion: @escaping (Result<Bool, Error>) -> Void) {
        let reference = self.database.collection(Collection.mood)

        self.addRecord(reference: reference, data: mood) { result in
            completion(result)
        }
    }
}
