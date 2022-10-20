import Foundation

extension Cell{
    
    enum Status: Equatable{
        case normal
        case exposed(Int)
        case bomb
    }
}
