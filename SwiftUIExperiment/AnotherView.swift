import SwiftUI

protocol ItemViewModeling: ObservableObject {
    var title: String { get }

    func save()
    func delete()
}

class ItemViewModel: ItemViewModeling {
    @Published var title = "Some default Title"

    func save() {
    }

    func delete() {
    }
}

let mockItemViewModel = ItemViewModel()

struct ItemView: View {
    @ObservedObject var viewModel: ItemViewModel

    var body: some View {
        Text(viewModel.title)
        Button("Save") { self.viewModel.save() }
    }
}
