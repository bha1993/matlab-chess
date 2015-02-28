classdef ChessBoard < handle
    %CHESSBOARD Represents the state of a game of chess
    %  The ActiveList property holds every piece currently on the
    %  ChessBoard and is updated by the functions addPiece and removePiece,
    %  which operate according to their names. addPiece will not add a
    %  piece to ActiveList if the piece's position is already occupied on
    %  the board. It determines this by using checkPosition, which iterates
    %  through the ActiveList to determine the position's availability. If
    %  that position is occupied, addPiece throws an error. Similarly,
    %  removePiece throws an error if the argument piece does not exist on
    %  the board/ in ActiveList.
    
    properties
        ActiveList = {}
    end
    
    methods
        function addPiece(board,piece)
            % Your code here
            pos = piece.Position;
            [occ, ~] = checkPosition(board, pos);
            if occ
                error('The intended position of the argument piece is occupied!');
            else
                len = length(board.ActiveList);
                new_len = len + 1;
                board.ActiveList{1, new_len} = piece;
            end               
        end
        
        function removePiece(board,piece)
            % Your code here
            aL = board.ActiveList;
            for i=1:length(aL)
                currPiece = aL{i};
                if piece == currPiece
                    board.ActiveList(:,i) = [];
                    return;
                end
            end
            error('Argument piece does not exist in the board''s list of active pieces!');
        end
        
        function [occupied, piece] = checkPosition(board,position)
            % Your code here
            aL = board.ActiveList;
            for i=1:length(aL)
                currPiece = aL{i};
                if aL{i}.Position == position
                    occupied = true;
                    piece = currPiece;
                    return;
                end
            end
            occupied = false;
            piece = [];
        end
        
    end
end
