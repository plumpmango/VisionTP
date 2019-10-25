function [I,J] = select2(R,NbPoints)
    vmax = maxk(R(:), NbPoints);
    [I,J] = find(and(ismember(R,vmax), R>0)); 
end

