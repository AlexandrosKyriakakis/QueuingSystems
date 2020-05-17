clc;
clear all;
close all;

lambda = 1;
mu = 1/4;
states = [0, 1, 2, 3, 4, 5 ,6 ,7 ,8]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda, lambda, lambda, lambda, lambda, lambda, lambda];
deaths_D = [mu, mu*2, mu*3, mu*4, mu*5, mu*5, mu*5, mu*5];

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
#figure(1);
#bar(states, P, "b", 0.5);
#title("Ergodic Proabilities λ=1/4");
#xlabel("States");
#ylabel("Probabilities");
P_waiting = P(6) + P(7) + P(8)
P_erlang_c =  erlangc(4 , 5)