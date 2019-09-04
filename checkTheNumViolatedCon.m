function theNumVio=checkTheNumViolatedCon(W,eachData,label)
    theNumVio=0;
    
    for i=1:size(eachData,1)
        y=W*eachData(i,:)';
        
        if(y*label(i)<0)
            theNumVio=theNumVio+1;
        
        end 
        
    end

end