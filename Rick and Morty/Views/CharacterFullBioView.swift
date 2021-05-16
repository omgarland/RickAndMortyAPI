//

import SwiftUI

struct CharacterFullBioView: View {
    
    @Binding var character: CharacterModel
    @StateObject var episodeModel = Episodes()
    private let network = Network()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: character.image)!,
                       placeholder: { Image("placeHolder")}
            )
            .frame(idealWidth: UIScreen.main.bounds.width)
            Text("\(Labels.name) \(character.name)" )
            Text("\(Labels.gender) \(character.gender)")
            Text("\(Labels.status) \(character.status)")
            Text("\(Labels.species) \(character.species)")
            let episodes: [EpisodeModel] = episodeModel.episodes.filter{ character.episode.contains($0.id)}
            Divider()
            Text("\(Labels.episodeAppearance)")
                .fontWeight(.bold)
            Divider()
            ScrollView {
                ForEach(episodes){ episode in
                    NavigationLink(destination: EpisodeView(episode:  .constant(episode))) {
                        HStack{
                            Text(episode.name)
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .padding(.trailing)
                        }
                    }.foregroundColor(Color.primary)
                    Divider()
                }
            }.onAppear(perform: refresh)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func refresh()
    {
        if episodeModel.episodes.isEmpty {
            network.requestAllEpisodes { (result) in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let all):
                    self.episodeModel.episodes.append(contentsOf: all.results)
                }
            }
        }
    }
}

