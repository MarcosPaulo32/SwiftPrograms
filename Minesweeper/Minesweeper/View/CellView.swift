import SwiftUI

struct CellView: View{
    @EnvironmentObject var game: Game
    let cell: Cell
    
    var body: some View{
        cell.image
            .resizable()
            .scaledToFill()
            .frame(width: game.settings.squareSize,
                   height: game.settings.squareSize,
                   alignment: .center)
            .onTapGesture(count: 2, perform: {
                game.toggleFlag(on: cell)
            })
            .onTapGesture {
                game.click(on: cell)
            }
            .onLongPressGesture {
                game.toggleFlag(on: cell)
            }
    }
}

struct CellView_Previews: PreviewProvider{
    static var previews: some View{
        CellView(cell: Cell(row: 0, column: 0))
            .environmentObject(Game(from: GameSettings()))
    }
}
