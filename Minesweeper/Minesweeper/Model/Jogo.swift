import Foundation

class Game: ObservableObject {
    @Published var settings: GameSettings
    @Published var board: [[Cell]]
    @Published var showResult: Bool = false
    @Published var isWon: Bool = false;
    
    init(from settings: GameSettings) {
        self.settings = settings
        board = Self.generatedBoard(from: settings)
    }
    func isPlayerWon() -> Bool{
        for row in 0..<settings.numberofRows{
            for col in 0..<settings.numberofColumns{
                if(board[row][col].status == .normal){
                    return false;
                }
            }
        }
        return true;
    }
    func click(on cell: Cell) {
        if case Cell.Status.exposed( _ ) = cell.status{
            return
        }
        if (cell.isFlagged){
            return;
        }
        if cell.status == .bomb{
            cell.isOpened = true
            showResult = true
            isWon = false;
        } else{
            reveal(for: cell)
        }
        if(isPlayerWon()){
            showResult = true
            isWon = true
        }
        
        self.objectWillChange.send()
        
    }
    func reset(){
        board = Self.generatedBoard(from: settings)
        showResult = false
        isWon = false
}
    func toggleFlag(on cell: Cell) {
        guard !cell.isOpened else{
            return
        }
        cell.isFlagged = !cell.isFlagged
        self.objectWillChange.send()
        if(isPlayerWon()){
            showResult = true
            isWon = true
        }
}
    private func reveal(for cell: Cell){
        guard !cell.isOpened else{
            return
        }
        guard !cell.isFlagged else{
            return
        }
        guard cell.status != .bomb else{
            return
        }
        let exposedCount = getExposedCount(for: cell)
        cell.status = .exposed(exposedCount)
        cell.isOpened = true
        if (exposedCount == 0){
            let topCell = board[max(0, cell.row - 1)][cell.column]
            let bottomCell = board[min(cell.row + 1, board.count - 1)][cell.column]
            let leftCell = board[cell.row][max(0, cell.column - 1)]
            let rightCell = board[cell.row][min(cell.column + 1, board[0].count - 1)]
            
            reveal(for: topCell)
            reveal(for: bottomCell)
            reveal(for: leftCell)
            reveal(for: rightCell)
        }
}
    private func getExposedCount(for cell: Cell) -> Int{
        let row = cell.row
        let col = cell.column
        
        let minRow = max(row - 1, 0)
        let minCol = max(col - 1, 0)
        let maxRow = min(row + 1, board.count - 1)
        let maxCol = min(col + 1, board[0].count - 1)
        
        var totalBombCount = 0
        for row in minRow...maxRow{
            for col in minCol...maxCol{
                if board[row][col].status == .bomb{
                    totalBombCount += 1
                }
            }
        }
        
        
        return totalBombCount
    }
    
    private static func generatedBoard(from settings: GameSettings) -> [[Cell]] {
        var newBoard = [[Cell]]()
        
        for row in 0..<settings.numberofRows {
            var column = [Cell]()
            
            for col in 0..<settings.numberofColumns{
                column.append(Cell(row: row, column: col))
            }
            
            newBoard.append(column)
        }
        
        var numberofBombsPlaced = 0
        while numberofBombsPlaced < settings.numberofBombs{
            let randomRow = Int.random(in: 0..<settings.numberofRows)
            let randomCol = Int.random(in: 0..<settings.numberofColumns)
            let currentRandomCellStatus = newBoard[randomRow][randomCol].status
            if currentRandomCellStatus != .bomb{
                newBoard[randomRow][randomCol].status = .bomb
                numberofBombsPlaced += 1
            }
        }
        
        return newBoard
    }
}
