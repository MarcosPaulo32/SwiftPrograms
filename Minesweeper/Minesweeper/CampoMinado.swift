import SwiftUI

@main
struct CampoMinado: App{
    var gameSettings = GameSettings()
    
    var body: some Scene{
        WindowGroup{
            BoardView()
                .environmentObject(Game(from: gameSettings))
        }
    }
}
