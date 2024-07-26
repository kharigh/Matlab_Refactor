function deployPcodeDir(sourceDir,destDir)
    if ~isequal(pwd,destDir) && ~exist(destDir,'dir')
        mkdir(destDir)
    end
    curr_dir = pwd;
    cd(sourceDir)
    pcode('*.m')
    
    movefile('*.p',[curr_dir '\' destDir])
    cd(curr_dir)
end

