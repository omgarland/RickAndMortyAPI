//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    private var cache: ImageCache?
    
    private let url: URL
    
    init(url: URL, cache: ImageCache? = nil){
        self.url = url
        self.cache = cache
    }
    
    deinit {
        cancel()
    }
    
    func load(){
        if let image = cache?[url]{
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink{[weak self] in self?.image = $0}
    }
    
    private func cache(_ image: UIImage?){
        image.map{cache?[url] = $0}
    }
    func cancel(){
        cancellable?.cancel()
    }
}
