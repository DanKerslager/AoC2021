clear
X=["0,9 -> 5,9;8,0 -> 0,8;9,4 -> 3,4;2,2 -> 2,1;7,0 -> 7,4;6,4 -> 2,0;0,9 -> 2,9;3,4 -> 1,4;0,0 -> 8,8;5,5 -> 8,2"]
X=strrep(X,"->",[])
B= str2num(X)+1;
field = zeros(10,10);

for i = 1: size(B,1)
    C = B(i,:);
    vector = zeros(10,10);
    if C(1)==C(3)
        if C(2)>C(4)
            vector(C(1),C(4):C(2))=1;
        else
            vector(C(1),C(2):C(4))=1;
        end
    elseif C(2)==C(4)
        if C(1)<C(3)
            vector(C(1):C(3),C(2))=1;
        else
            vector(C(3):C(1),C(2))=1;
        end
    elseif abs(C(1)-C(3))==abs(C(2)-C(4))
        diagcount = (abs(C(1)-C(3))+1);
        if (C(1)>C(3)&&C(2)<C(4)) || (C(1)<C(3)&&C(2)>C(4))
                Ctemp = C([1,2]);
                C([1,2]) = C([3,4]);
                C([3,4]) = Ctemp;
        end
        for j = 1:diagcount
            k=j-1;
            if (C(2)<C(4) && C(1)<C(3))||(C(2)>C(4) && C(1)>C(3))
                vector((C(1)+k),(C(2)+k))=1;
            else
                vector((C(1)+k),(C(2)-k))=1;
            end
        end
    end
    %s= sum(sum(field));
    field = field+vector;
end
field=flip(field);
danger = field >1;
dangernum = sum(sum(danger))