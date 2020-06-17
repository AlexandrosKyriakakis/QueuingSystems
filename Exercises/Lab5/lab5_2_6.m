max_lambda = 6
for i=1:99
   l = max_lambda*i/100;
   vec_lambda(i) = l;
   lambda = [l,1];
   mu = [6,5,8,7,6];
   vec_sum(i) = sum(mean_clients(lambda,mu))/sum(lambda);
endfor

figure(1);
plot(vec_lambda,vec_sum,"r","linewidth",2);
title("Mean Waiting Time","fontsize", 15);
xlabel('\lambda_1',"fontsize", 15);
ylabel("Waiting Time","fontsize", 15);
saveas (1, "figure2.png");