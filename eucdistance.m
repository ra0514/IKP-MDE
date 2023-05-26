function d = eucdistance(v1,v2)
k=length(v1);
d=0;
for i=1:k
    d=d+(v1(i)-v2(i))^2;
end
d=sqrt(d);
end