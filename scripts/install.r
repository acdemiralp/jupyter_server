options(timeout=3600);
update.packages(ask=FALSE, repos='http://cloud.r-project.org');
install.packages('IRkernel', repos='http://cloud.r-project.org'); 
IRkernel::installspec(user=TRUE)