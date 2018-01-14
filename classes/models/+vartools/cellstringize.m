function x=cellstringize(x)

if ischar(x)
    
    x=cellstr(x);
    
end

if ~iscellstr(x)
    
    error('names must be a char or a cellstr')
    
end

good=cellfun(@isvarname,x);

badx=x(~good);

if ~isempty(badx)
    
    disp(badx)
    
    error('the above variables are not valid variable names')
    
end

n=numel(x);

ux=unique(x);

if n>numel(ux)
    
    badx=cell(1,n);
    
    ii=0;
    
    while ~isempty(ux)
        
        ping=strcmp(ux{1},x);
        
        if sum(ping)>1
            
            ii=ii+1;
            
            badx{ii}=ux{1};
            
        end
        
        ux=ux(2:end);
        
    end
    
    badx=badx(1:ii);
    
    disp(badx)
    
    error('the above variables are duplicated')
    
end

end
