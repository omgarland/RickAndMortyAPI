//

import SwiftUI

struct LocationView: View {
    @Binding var location: LocationModel
    var body: some View {
        VStack {
            Text("\(Labels.name) \(location.name)")
            Text("\(Labels.dimension) \(location.dimension)")
            Text("\(Labels.type) \(location.type)")
        }
    }
}
