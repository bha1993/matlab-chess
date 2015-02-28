classdef Pawn < ChessPiece
    %PAWN Represents a pawn piece in chess.
    %   Calls the ChessPiece superclass' constructor and defines getSymbol
    %   as appropiate.
    
    properties
        Direction
        Attack1
        Attack2
    end
    
    methods
        function obj = Pawn(pos, board, team)
            obj@ChessPiece(pos, board, team);
            obj.initializeProperties(team);
        end
        
        function y = getSymbol(obj)
            y = 'P';
        end
        
        function moves = getMoves(piece)
            
            out = [];
            forward_spot = piece.Position + piece.Direction;
            if forward_spot(2) ~= 1 && forward_spot(2) ~= 8
                [occ, ~] = piece.Board.checkPosition(forward_spot);
                if ~occ
                    out = [out; forward_spot 0];
                end
            end
            
            diag1 = piece.Position + piece.Attack1;
            [occ1, pc1] = piece.Board.checkPosition(diag1);
            if occ1 && (pc1.Team ~= piece.Team)
                out = [out; diag1 1];
            end
            
            diag2 = piece.Position + piece.Attack2;
            [occ2, pc2] = piece.Board.checkPosition(diag2);
            if occ2 && (pc2.Team ~= piece.Team)
                out = [out; diag2 1];
            end
            
            moves = out;
        end
        
        function y = getMoveArray(obj)            
            y = {};
        end
    end
    
end

