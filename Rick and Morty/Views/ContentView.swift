//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Characters()
    private var network = Network()
    
    var body: some View {
        NavigationView {
            VStack {
                ExplainationView()
                Divider()
                Text("\(Labels.characters)")
                    .fontWeight(.bold)
                Divider()
                ScrollView {
                    ForEach(model.characters){ character in
                        NavigationLink(destination: CharacterFullBioView(character: .constant(character))) {
                            HStack {
                                CharacterListItemView(character: .constant(character))
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding(.trailing)
                            }
                        }
                        .foregroundColor(Color.primary)
                        Divider()
                    }
                }
            }
        }.onAppear(perform: refresh)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func refresh() {
        if self.model.characters.isEmpty {
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

