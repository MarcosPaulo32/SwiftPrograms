import Foundation
import SwiftUI

class GameSettings: ObservableObject{
    @Published var numberofRows = 10
    @Published var numberofColumns = 10
    @Published var numberofBombs = 10
    var squareSize: CGFloat{
    UIScreen.main.bounds.width / CGFloat(numberofColumns)
}
}
