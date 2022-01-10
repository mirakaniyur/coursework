
def solveNQueens(size, col=0, board = []):
    #Create starting board
    if col == 0:
        board = [["*" for i in range(size)] for i in range(size)]
    # Test Candidate
    if col >= size: 
        printSolution(board, size)
        return True
    # Generate & Test Candidates
    for i in range(size):
        if TestCandidate(board, size, i, col): 
            board[i][col] = "Q"
            if (solveNQueens(size, col + 1, board)): 
                return True
            board[i][col] = "*"
    return False

def TestCandidate(board, size, row, col): 
    # Check left side of row
    for i in range(col): 
        if board[row][i] == "Q": 
            return False
    # Check left side, upper diagonal 
    for i,j in zip(range(row,-1,-1), range(col,-1,-1)): 
        if board[i][j] == "Q": 
            return False
    # Check left side, lower diagonal 
    for i,j in zip(range(row,size,1), range(col,-1,-1)): 
        if board[i][j] == "Q": 
            return False
    return True

def printSolution(board, size): 
    for i in range(size): 
        for j in range(size):
                        if j< size-1 :
                                print (board[i][j], end = ' '),
                        elif j == size-1 :
                                print (board[i][j])
    print("")
    quit

solveNQueens(10)
