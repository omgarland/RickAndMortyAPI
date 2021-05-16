//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Characters()
    private var network = Network()
    
    var body: some View {
        NavigationView {
            VStack {
                ExplainationView()
                    .frame(maxWidth: .infinity)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                List {
                    ForEach(model.characters){ character in
                        NavigationLink(destination: CharacterFullBioView(character: .constant(character))) {
                            CharacterListItemView(character: .constant(character))
                        }
                    }
                }
            }.onAppear(perform: refresh)
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

