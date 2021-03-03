import SwiftUI
import CoreData

struct PlaylistView: View {
    @ObservedObject private var viewModel: PlaylistViewModel
    
    init(viewModel: PlaylistViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(0..<1000, id: \.self) { index in
            TrackView(viewModel: viewModel.trackViewModel(for: index % 1009))
        }
        .navigationTitle("Messages")
    }
}
