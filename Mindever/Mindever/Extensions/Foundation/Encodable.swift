import Foundation

extension Encodable {

    var dictionary: [String : Any]? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else { return nil }
        let encodedData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return encodedData.flatMap { $0 as? [String : Any] }
    }
}
