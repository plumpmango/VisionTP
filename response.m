function [R] = response(Im,SigmaDerivation,SigmaIntegration,Method)
    [K,Ix,Iy] = gaussmask2(SigmaDerivation);
    %estimation des dérivées en x et en y pour discrétisation
    Ii = conv2(Im,Ix,'same');
    Ij = conv2(Im,Iy,'same');
    
    %coeff du gradient * gradient transposé
    A = Ii.^2;
    C = Ij.^2;
    B = Ii.*Ij;
    
    %coeff de la matrice k = noyeau de lissage gaussien
    K = gaussmask2(SigmaIntegration);
    KA = conv2(A,K,'same');
    KB = conv2(B,K,'same');
    KC = conv2(C,K,'same');
    
    detK = KA.*KC - KB.^2;
    trK = KA + KC;
    
    if(strcmp(Method,'Harris-Plessey'))
        k = 0.04;
        R = detK - k*(trK.^2);
    end
    
    if(strcmp(Method,'Noble'))
        R = 2*detK./(trK+eps);
    end
    
    if(strcmp(Method,'Shi-Tomasi'))
        %on prend le lambda de la valeur la plus petite
        lambda = 1/2 * (KA + KC - (sqrt((A - C).^2 + 4*(B.^2))));
        R = lambda;
    end
    
    
    
end

