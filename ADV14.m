clear
format long
%poly = char("NNCB");
poly = char("OFSNKKHCBSNKBKFFCVNB");
%key = ["CH","B";"HH","N";"CB","H";"NH","C";"HB","C";"HC","B";"HN","C";"NN","C";"BH","H";"NC","B";"NB","B";"BN","B";"BB","N";"BC","B";"CC","N";"CN","C"];
key= ["KC","F";"CO","S";"FH","K";"VP","P";"KF","S";"SV","O";"CB","H";"PN","F";"NC","N";"BC","F";"NP","O";"SK","F";"HS","C";"SN","V";"OP","F";"ON","N";"FK","N";"SH","B";"HN","N";"BO","V";"VK","H";"SC","K";"KP","O";"VO","V";"HC","P";"BK","B";"VH","N";"PV","O";"HB","H";"VS","F";"KK","B";"HH","B";"CF","F";"PH","C";"NS","V";"SO","P";"NV","K";"BP","N";"SF","V";"SS","K";"FP","N";"PC","S";"OH","B";"CH","H";"VV","S";"VN","O";"OB","K";"PF","H";"CS","C";"PP","O";"NF","H";"SP","P";"OS","V";"BB","P";"NO","F";"VB","V";"HK","C";"NK","O";"HP","B";"HV","V";"BF","V";"KO","F";"BV","H";"KV","B";"OF","V";"NB","F";"VF","C";"PB","B";"FF","H";"CP","C";"KH","H";"NH","P";"PS","P";"PK","P";"CC","K";"BS","V";"SB","K";"OO","B";"OK","F";"BH","B";"CV","F";"FN","V";"CN","P";"KB","B";"FO","H";"PO","S";"HO","H";"CK","B";"KN","C";"FS","K";"OC","P";"FV","N";"OV","K";"BN","H";"HF","V";"VC","S";"FB","S";"NN","P";"FC","B";"KS","N"];
steps=40;
for step=1:steps
    addcount=1;
    for keynum = 1:size(key,1)
        polynum=1;
        while polynum < length(poly)
            if append(poly(polynum),poly(polynum+1)) == key(keynum,1)
                newcharnum(addcount)=polynum+1;
                newchar(addcount)=key(keynum,2);
                addcount=addcount+1;
            end
            polynum=polynum+1;
        end
    end
    [newcharnum,idx]=sort(newcharnum);
    newchar = newchar(idx);
    for i = 1:length(newchar)
        addnum=i-1;
        x=newcharnum(i);
        polynew = char(poly(1:(x+addnum-1)));
        polynew = polynew + newchar(1,i);
        polynew = polynew + poly(newcharnum(1,i)+addnum:end);
        poly=char(polynew);
    end
end
letters=unique(poly);
sums=zeros(1,length(letters));
for i=1:length(letters)
    sums(i)=count(poly,letters(i));
end
length(poly)
out= max(sums)-min(sums)