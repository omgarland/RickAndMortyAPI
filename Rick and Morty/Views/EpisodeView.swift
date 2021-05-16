//

import SwiftUI

struct EpisodeView: View {
    @Binding var episode: EpisodeModel
    @StateObject var model = Characters()
    var network = Network()
    
    var body: some View {
        VStack {
            Text("\(Labels.name) \(episode.name)")
                .onAppear(perform: refresh)
            Text("\(Labels.episodeNumber) \(episode.episode)")
            Text("\(Labels.airDate) \(episode.airDate)")
            let characters: [CharacterModel] = model.characters.filter { episode.characters.contains($0.id)}
            List {
                Section(header: Text("\(Labels.characterAppearance)")) {
                    ForEach(characters){ character in
                        NavigationLink(destination: CharacterFullBioView(character: .constant(character))) {
                            CharacterListItemView(character: .constant(character))
                         }
                     }
                }
            }
        }
    }
    
    func refresh() {
        if model.characters.isEmpty {
           network.requestAllCharacters { (result) in
                switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                   
                    case .success(let characterInfo):
                    self.model.characters.append(contentsOf: characterInfo.results)
                }
            }
        }
    }
}
