import Inject
import SwiftUI

public struct AppView: View {
    @ObserveInjection var iO

    public init() {}

    public var body: some View {
        VStack {
            HStack {
                Text("Hello, Inject!")
                Image(systemName: "syringe")
                    .foregroundColor(.blue)
            }
            .font(.title)
            .padding()

            Text("Change this view to see it updates in the simulator")
                .font(.footnote)
        }
        .enableInjection()
    }
}

#Preview {
    AppView()
}
