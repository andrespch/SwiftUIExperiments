import SwiftUI
import Combine

class Deinitable: ObservableObject {
    deinit {
        print("Deinitable deinited")
    }
}

class AnotherDeinitable {
    deinit {
        print("AnotherDeinitable deinited")
    }
}

struct TrackView: View {
    @ObservedObject private var viewModel: TrackViewModel
    @StateObject private var deinitable = Deinitable()
    private var anotherDeinitable = AnotherDeinitable()
    
    init(viewModel: TrackViewModel) {
        print("track view init")
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(self.viewModel.title)
    }
}
