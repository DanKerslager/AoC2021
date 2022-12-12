clear
%X = ["5483143223","2745854711","5264556173","6141336146","6357385478","4167524645","2176841721","6882881134","4846848554","5283751526"];
X = ["2138862165","2726378448","3235172758","6281242643","4256223158","1112268142","1162836182","1543525861","1882656326","8844263151"];
X = char(X);
steps=1000;
Y=zeros(12,12);
Y([1,end],:)=-(steps*10);
Y(:,[1,end])=-(steps*10);
for i = 1:size(X,2)
    for j = 1:size(X,3)
        Y(i+1,j+1)= str2num(X(1,j,i));
    end
end
out=0;
blink=10:20;
outarray=zeros(12,12);
for step = 0:steps-1
    over=zeros(12,12);
    Y=Y+1;
    while sum(sum(ismember(Y,blink)))~=0
        for i = 2:size(Y,2)-1
            for j = 2:size(Y,2)-1
                if ismember(Y(i,j),blink)
                    over(i,j)=1;
                    Y(i,j)=100;
                    Y(i+1,j)=Y(i+1,j)+1;
                    Y(i-1,j)=Y(i-1,j)+1;
                    Y(i,j+1)=Y(i,j+1)+1;
                    Y(i,j-1)=Y(i,j-1)+1;

                    Y(i+1,j-1)=Y(i+1,j-1)+1;
                    Y(i+1,j+1)=Y(i+1,j+1)+1;
                    Y(i-1,j-1)=Y(i-1,j-1)+1;
                    Y(i-1,j+1)=Y(i-1,j+1)+1;
                end
            end
        end
    end
    Y(Y>99)=0;
    over(Y>99)=1;
    oversum=sum(sum(over));
    if oversum== 100
        break
    end
end