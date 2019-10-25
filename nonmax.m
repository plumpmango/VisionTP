function [R2] = nonmax(R1,WindowSize)
    
    t = floor(WindowSize/2);
    [ligne, col] = size(R1);
    R2 = zeros(ligne,col);
    
    for i = t+1 : ligne-t
     for j = t+1 : col-t
        %sous matrice des voisins du px
        MVoisin =  R1(i-t:i+t,j-t:j+t);
        
        if(R1(i,j) == max(MVoisin( : )))
            R2(i,j) = max(MVoisin( : ));
        end
     end
    end
    
    
end

