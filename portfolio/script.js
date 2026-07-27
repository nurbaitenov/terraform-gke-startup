const jobs = [

    "DevOps Engineer",
    
    "Kubernetes Administrator",
    
    "Terraform Engineer",
    
    "Cloud Engineer",
    
    "AWS Solutions Architect"
    
    ];
    
    let job = 0;
    
    let letter = 0;
    
    let deleting = false;
    
    const text = document.getElementById("typing");
    
    function type(){
    
    let current = jobs[job];
    
    if(!deleting){
    
    text.textContent=current.substring(0,letter++);
    
    if(letter>current.length){
    
    deleting=true;
    
    setTimeout(type,1800);
    
    return;
    
    }
    
    }
    
    else{
    
    text.textContent=current.substring(0,--letter);
    
    if(letter===0){
    
    deleting=false;
    
    job++;
    
    if(job>=jobs.length){
    
    job=0;
    
    }
    
    }
    
    }
    
    setTimeout(type,deleting?60:120);
    
    }
    
    type();