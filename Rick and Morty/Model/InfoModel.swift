//

import Foundation

struct InfoModel: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}

protocol Pageable: Decodable {
    var info: InfoModel { get set }
    associatedtype results
}

extension Pageable {
    func getNext() -> String? {
        if let next = info.next {
            return next
        }
        return nil
    }
}
