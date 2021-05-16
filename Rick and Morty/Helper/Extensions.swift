//

import Foundation
import SwiftUI

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate file \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not decode \(file)")
        }
        print("\(data.description)")
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file)")
        }
        return loaded
    }
}
