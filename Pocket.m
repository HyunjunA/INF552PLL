function Pocket(col)
    %The major part of this code is same in Perceptron.m
    %Only different things are to plot the violated number in each W
    %vector, and label is 5th column, not 4th column.
    %
    %sub function: checkTheNumViolatedCon
    eachData = importdata('classification.txt');
    label=eachData(:,col);
    
    eachData(:,5)=[];
    eachData(:,4)=1;
    
    
    %w should never be zero.
    %W = rand(1,4,'single');
    W=[0.4387,0.3816,0.7655,0.7952];
    x=[];
    alpha=0.1; %learning rate%
    iterationNum=7000;%the number of internation 
    %%
    j=1;
    k=1;
    
    
    while j<=iterationNum
        for i=1:size(eachData,1)

            while 1

                y=W*eachData(i,:)';
                
                %Sometimes y==0 happends.
                if(y==0)
                   
      
                    %from -side To +side
                    if ( label(i)==1)
                        
                        W=W+alpha*eachData(i,:);
                        y=W*eachData(i,:)';
                    end
                    
                    %from +side To -side
                    if ( label(i)==-1)
                        
                        W=W-alpha*eachData(i,:)
                        y=W*eachData(i,:)';
                    end
                end
                
                
                if(y*label(i)>0)
                    break;
                end


                if(y*label(i)<0)
                    %from -side To +side
                    if(label(i)==1) 
                        W=W+alpha*eachData(i,:);
                    end
                    
                    %from +side To -side
                    if(label(i)==-1) 
                        W=W-alpha*eachData(i,:);
                    end
                end

            end

            

        end
        i=1;
        j=j+1;
        
        
        %check violated constrain%
        theNumVio=checkTheNumViolatedCon(W,eachData,label);
            
        re=[k,theNumVio];
        k=k+1;
        x=[x;re];
        %internation index, the number of violated constrains numbers
        
    end
        
    plot(x(:,1),x(:,2));
end 

