//

import Foundation
import Combine

class Network {
    private var cancellable: Cancellable?
    func requestAllCharacters(completion: @escaping (Result<CharacterPage, Error>) -> Void)
    {
        request(url: URLS.characters, decodingType: CharacterPage.self, resultCompletion: completion)
    }
    
    func requestAllLocations(completion: @escaping (Result<LocationPage, Error>) -> Void)
    {
        request(url: URLS.locations, decodingType: LocationPage.self, resultCompletion: completion)
    }
    
    func requestAllEpisodes(completion: @escaping (Result<EpisodePage, Error>) -> Void)
    {
        request(url: URLS.episodes, decodingType: EpisodePage.self, resultCompletion: completion)
    }
    
    private func request<T: Decodable & Pageable>(url: URL, decodingType: T.Type, resultCompletion: @escaping (Result<T, Error>) -> Void) {
        self.cancellable = request(url: url, decodingType: T.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    resultCompletion(.failure(error))
                default:
                    break
                }
            }) { [weak self] (completion) in
                resultCompletion(.success(completion))
                if let next = completion.info.next, let nextUrl = URL(string: next){
                    self?.request(url: nextUrl, decodingType: T.self, resultCompletion: resultCompletion)
                }
            }
    }
    
    private func request<T: Decodable & Pageable>(url: URL, decodingType: T.Type) -> AnyPublisher<T, Error> {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 5.0)
        let session = getSession()
        return session.dataTaskPublisher(for: request)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private func getSession() -> URLSession {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }
}
