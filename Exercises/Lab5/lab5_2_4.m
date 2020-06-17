lambda = [4,1];
mu = [6,5,8,7,6];
Rho = mean_clients(lambda,mu);
sumation = sum(Rho)/sum(lambda);
printf("Average service time: %d", sumation);