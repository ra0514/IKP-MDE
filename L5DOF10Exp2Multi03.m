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

dpF = xlsread('pathcircledata.xlsx'); %close path
dpF=transpose(dpF); %close path

D=length(ip);
NP=20; %Number of individuals in the population

totaliter=0;

for nexp=2:51 %for circle path, (excluded the first potin because is the initial position)


for i=1:NP
    for j=1:D
        %ip=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180; %0riginal Q1UNCOMMENT, same best candidate
        %pop(i,j)=tj*(rand-0.5)+ip(j);%population around candidate
        
        ipIN=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180; %Reference for initial population
        pop(i,j)=tj*(rand-0.5)+0.5*(ip(j)+ipIN(j));%promedio
        
        %pop(i,j)=pi*(rand-0.5);%random popultaion
        
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

writematrix(historic,'test.xlsx','Sheet',1,'Range','A1')%CIRCULAR PATH bias prom