clear
format longE
fish =[1,3,1,5,5,1,1,1,5,1,1,1,3,1,1,4,3,1,1,2,2,4,2,1,3,3,2,4,4,4,1,3,1,1,4,3,1,5,5,1,1,3,4,2,1,5,3,4,5,5,2,5,5,1,5,5,2,1,5,1,1,2,1,1,1,4,4,1,3,3,1,5,4,4,3,4,3,3,1,1,3,4,1,5,5,2,5,2,2,4,1,2,5,2,1,2,5,4,1,1,1,1,1,4,1,1,3,1,5,2,5,1,3,1,5,3,3,2,2,1,5,1,1,1,2,1,1,2,1,1,2,1,5,3,5,2,5,2,2,2,1,1,1,5,5,2,2,1,1,3,4,1,1,3,1,3,5,1,4,1,4,1,3,1,4,1,1,1,1,2,1,4,5,4,5,5,2,1,3,1,4,2,5,1,1,3,5,2,1,2,2,5,1,2,2,4,5,2,1,1,1,1,2,2,3,1,5,5,5,3,2,4,2,4,1,5,3,1,4,4,2,4,2,2,4,4,4,4,1,3,4,3,2,1,3,5,3,1,5,5,4,1,5,1,2,4,2,5,4,1,3,3,1,4,1,3,3,3,1,3,1,1,1,1,4,1,2,3,1,3,3,5,2,3,1,1,1,5,5,4,1,2,3,1,3,1,1,4,1,3,2,2,1,1,1,3,4,3,1,3];
%fish=[3,4,3,1,2];
fish = fish+1;
group=zeros(9,1);
for i=1:7
    group(i)=sum(fish==i);
end
for day= 1:80
grouptemp=group(1);
group(1)=group(2);
group(2)=group(3);
group(3)=group(4);
group(4)=group(5);
group(5)=group(6);
group(6)=group(7);
group(7)=group(8)+grouptemp;
group(8)=group(9);
group(9)=grouptemp;
end
fishamount=sum(group)