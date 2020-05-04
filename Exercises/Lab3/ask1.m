% M/M/1 simulation. We will find the probabilities of the first states.
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;
rand('seed',12163);

lambdaAll = [1,5,10];
for i = lambdaAll
    arrivals = [0,0,0,0,0,0,0,0,0,0,0]
    total_arrivals = 0; % to measure the total number of arrivals
    current_state = 0;  % holds the current state of the system
    previous_mean_clients = 0; % will help in the convergence test
    index = 0;
    mu = 5;
    threshold = (i)/((i) + mu); % the threshold used to calculate probabilities

    transitions = 0; % holds the transitions of the simulation in transitions steps
    %my_i = 0
    %traceMatr = [];
    while  transitions >= 0 % && transitions < 30
        transitions = transitions + 1; % one more transitions step
        %{
        my_i = my_i + 1
        if 0 < my_i < 31 && current_state > 0
            traceMatr(my_i,1) = my_i;
            traceMatr(my_i,2) = current_state;
            traceMatr(my_i,3) = arrivals(current_state);
        endif
        %}
        if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
            index = index + 1;
            for j=1:1:length(arrivals)
                P(j) = arrivals(j)/total_arrivals; % calcuate the probability of every state in the system
            endfor
            
            mean_clients = 0; % calculate the mean number of clients in the system
            for j=1:1:length(arrivals)
                mean_clients = mean_clients + (j-1).*P(j);
            endfor
            
            to_plot(index) = mean_clients;
                
            if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
            break;
            endif
            
            previous_mean_clients = mean_clients;
            
        endif
        
        random_number = rand(1); % generate a random number (Uniform distribution)
        if current_state == 0 || random_number < threshold % arrival
            %{
            if 0 < my_i < 31
                traceMatr(my_i,4) = 1
                %disp("arrival"), disp(current_state);
            endif 
            %}
            total_arrivals = total_arrivals + 1;
            try % to catch the exception if variable arrivals(i) is undefined. Required only for systems with finite capacity.
            x = arrivals(current_state + 1) + 1
            arrivals(current_state + 1) = x; % increase the number of arrivals in the current state
            current_state = current_state + 1;
            catch
            if i == 10
                arrivals(current_state) = arrivals(current_state) + 1 ;
            endif
            %current_state = current_state + 1;
            end
        else % departure
            %{
            if 0 < my_i < 31
                traceMatr(my_i,5) = 1
                %disp("departure"), disp(current_state);
            endif
            %}
            if current_state != 0 % no departure from an empty system
            current_state = current_state - 1;
            endif
        endif
    endwhile
    #{
    for j=1:1:length(arrivals)
        display(P(j));
    endfor
    display(traceMatr);
    pause(5);
    #}
    figure(1);
    plot(to_plot,"b","linewidth",2);
    title(strjoin({"Average number of clients in the M/M/1/10 queue: Convergence for Lambda = ",num2str((i))},""));
    xlabel("Transitions in thousands");
    ylabel("Average number of clients");
    grid on;
    saveas (1, strjoin({"figure_",num2str(1),"_lambda_",num2str((i)),".png"},""))
    figure(2);
    bar(0:1:(length(arrivals)-1),P,'b',0.4);
    title(strjoin({"Probabilities for Lambda = ",num2str((i))},""));
    grid on;
    saveas (2, strjoin({"figure_",num2str(2),"_lambda_",num2str((i)),".png"},""))

    clc;
    clear all;
    close all;
    
endfor
exit;