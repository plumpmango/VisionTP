function [I,J] = select1(R,Percent)
    %sélectionne les pixels R >= Percent% de la plus grande réponse
    seuil = (Percent/100) * max(R( : ));
    [I,J] = find(R >= seuil); 
end

