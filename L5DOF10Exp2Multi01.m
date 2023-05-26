clc
clear

tic

Q=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180; %0riginal Q1

%first population
pop = [];
newpop= [];
fpop = [];
fnewpop = [];
trial = [];
tj=4*pi/180; %+-2 degree tolerance
maxI=50000-1;
error=0.001;
F=0.6;
CR=0.5;

ip=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180; %0riginal Q1

dp1=[7.3592  -30.3924  -21.7950];%f1
dp2=[8.7638  -29.2377  -20.4845];%f2
dp3=[10.1683  -28.0830  -19.1739];%f3
dp4=[11.5728  -26.9283  -17.8634];%f4
dp5=[12.9774  -25.7736  -16.5528];%f5
dp6=[14.3819  -24.6188  -15.2422];%f6
dp7=[15.7864  -23.4641  -13.9317];%f7
dp8=[17.1909  -22.3094  -12.6211];%f8
dp9=[18.5955  -21.1547  -11.3106];%f9
dp10=[20,-20,-10]; %f10 desire position

dpF=[dp1;dp2;dp3;dp4;dp5;dp6;dp7;dp8;dp9;dp10];

D=length(ip);
NP=20; %Number of individuals in the population

totaliter=0;

for nexp=1:10 %path size


for i=1:NP
    for j=1:D
        ip=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180; %0riginal Q1UNCOMMENT, same best candidate
        pop(i,j)=tj*(rand-0.5)+ip(j);%population around candidate
                
    end
    fpop(i)=eucdistance(L5DOF10F(pop(i,:)),dpF(nexp,:));
end

[fbest,indicefbest]=min(fpop);
hfbest(1)=fbest;

iter=0;
while(iter<maxI && fbest>error)
    %crossing and mutation process
    for i=1:NP
        while 1
            a=floor(rand*NP)+1;
            if a>D
                a=D;
            end
            if a~=i
                break;
            end
        end
        while 1
            b=floor(rand*NP)+1;
            if b>D
                b=D;
            end
            if b~=i && b~=a
                break;
            end
        end
        while 1
            c=floor(rand*NP)+1;
            if c>D
                c=D;
            end
            if c~=i && c~=b && c~=a
                break;
            end
        end
        mv=pop(c,:)+F*(pop(a,:)-pop(b,:));
                
        %binomial cross
        dif=round(D*rand()+0.5);
        if(dif>D)
            dif=D;
        end
        for k=1:D
            if rand < CR || k==dif
                trial(k)=mv(k);
            else
                trial(k)=pop(i,k);
            end
        end
        
            
        %selection
        ftrial=eucdistance(L5DOF10F(trial),dpF(nexp,:));
        if ftrial<=fpop(i)
            newpop(i,:)=trial;
            fnewpop(i)=ftrial;
        else
            newpop(i,:)=pop(i,:);
            fnewpop(i)=fpop(i);            
        end
    end
    
   
    pop=newpop;
    fpop=fnewpop;
        
    [fbest,indicefbest]=min(fpop);
    hfbest(iter+2)=fbest;
    
    iter=iter+1;
    
end

totaliter=totaliter+iter;

ip=pop(indicefbest,:);

historic(nexp,:)=pop(indicefbest,:);

end
toc
pop(indicefbest,:)
totaliter
fbest
eucdistance(pop(indicefbest,:),Q)

writematrix(historic,'line.xlsx','Sheet',1,'Range','A1')%Line