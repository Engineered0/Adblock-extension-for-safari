import SwiftUI

struct ContentView: View {
    @State private var isAdBlockerEnabled = UserDefaults.standard.bool(forKey: "isAdBlockerEnabled")

    var body: some View {
        VStack {
            Toggle(isOn: $isAdBlockerEnabled) {
                Text("Enable AdBlocker")
            }
            .padding()
            .onChange(of: isAdBlockerEnabled) { value in
                UserDefaults.standard.set(value, forKey: "isAdBlockerEnabled")
                NotificationCenter.default.post(name: NSNotification.Name("AdBlockerStatusChanged"), object: nil)
            }
        }
        .frame(width: 200, height: 100)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
