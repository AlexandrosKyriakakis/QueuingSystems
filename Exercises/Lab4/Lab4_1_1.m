pkg load statistics
pkg load queueing

clc;
clear all;
close all;


lambda = [1/4, 1];
for i=1:columns(lambda)
    mu = 1/4;
    states = [0, 1, 2, 3, 4, 5, 6, 7, 8]; % system with capacity 4 states
    % the initial state of the system. The system is initially empty.
    initial_state = [1, 0, 0, 0, 0, 0, 0, 0, 0];

    % define the birth and death rates between the states of the system.
    births_B = [ lambda(i), lambda(i), lambda(i), lambda(i), lambda(i), lambda(i), lambda(i), lambda(i)];
    deaths_D = [ mu, mu*2, mu*3, mu*4, mu*5, mu*5, mu*5, mu*5];

    % get the transition matrix of the birth-death process
    transition_matrix = ctmcbd(births_B, deaths_D);
    display (transition_matrix)

    # (ii)
    % get the ergodic probabilities of the system
    P = ctmc(transition_matrix);
    display (P);

    figure(i);
    hold on;
    title(strjoin({"Bar of Probabilities per state with \\lambda = ",num2str(lambda(i))}, ""))
    xlabel("State")
    ylabel("Probability")
    bar(states, P, "b", 0.5);
    grid on;
    saveas (i, strjoin({"figures/figure_lambda",num2str(i),".png"},""))
    hold off;
    display(strjoin({"Erlang C for lambda = ",num2str(lambda(i)),": ", num2str(erlangc(lambda(i)/mu,5))}, ""))
    display(strjoin({"Estimated Prob for lambda = ",num2str(lambda(i)),": ", num2str(P(6)+P(7)+P(8))}, ""))
endfor

clc;
clear all;
close all;
exit;