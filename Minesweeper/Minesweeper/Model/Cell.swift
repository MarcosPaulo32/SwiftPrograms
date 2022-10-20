import Foundation
import SwiftUI

class Cell: ObservableObject {
    var row: Int
    var column: Int
    
    @Published var status: Status
    @Published var isOpened: Bool
    @Published var isFlagged: Bool
    
    var image: Image{
        if !isOpened && isFlagged{
            return Image("flag")
        }
        switch status{
        case .bomb:
            if isOpened{
                return Image("bomb")
            }
            return Image("normal")
        case .normal:
            return Image("normal")
        case .exposed(let total):
            if !isOpened{
                return Image("normal")
            }
            if total == 0{
                return Image("empty")
            }
            return Image("\(total)")
        }
    }
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
        self.status = .normal
        self.isOpened = false
        self.isFlagged = false
    }
}
