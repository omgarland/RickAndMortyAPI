//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Characters()
    @State var isActive : Bool = false
   // @EnvironmentObject private var characterCollection: Characters
    @EnvironmentObject var appState: AppState
 
    private var network = Network()
    
    var body: some View {
        NavigationView {
            VStack {
                ExplainationView()
                Divider()
                ScrollView {
                    ForEach(model.characters){ character in
                        NavigationLink(destination: CharacterFullBioView(rootIsActive: self.$isActive, character: .constant(character)), isActive: $isActive) {
                            HStack {
                            CharacterListItemView(character: .constant(character))
                                .padding(.leading)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding(.trailing)
                            }
                        }.isDetailLink(false)
                        .foregroundColor(Color.primary)
                        Divider()
                    }
                }
            }.onAppear(perform: refresh)
            .onReceive(self.appState.$moveToDashboard) { moveToDashboard in
                           if moveToDashboard {
                               print("Move to dashboard: \(moveToDashboard)")
                              // self.isView1Active = false
                               self.appState.moveToDashboard = false
                           }
                       }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
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

