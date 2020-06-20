import numpy as np
#import scipy as sp
from scipy.stats import binom
from scipy.stats import poisson
import matplotlib.pyplot as plt
countFig = 0
figureTitles = ["Probability Mass Function of Poisson processes","Convolution of two Poisson processes","Poisson process as the limit of the Binomial process","Probability Density Function of Exponential Process","Cumulative Density Function of Exponential Process","Poisson Process"]
labelTuple = [("k values","Probability"),("k values","Probability"),("k values","Probability"),("k values","Probability"),("k values","Probability"),("Time","k count")]
def show_plot():
    global countFig, labelTuple
    ax.legend()
    ax.grid()
    #plt.show() #FIXME Disabled
    plt.title(figureTitles[countFig])
    xlabel, ylabel = labelTuple[countFig]
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    
    plt.savefig("/Users/alexanders_mac/Desktop/Profiteus/NTUA/Συστήματα Αναμονής/Exercises/Lab1/figures/figure{}".format(countFig))
    countFig += 1
def rm_plot():
    plt.clf()
    plt.cla()
    plt.close()

#Katanomi Poisson

#Alpha
tau = np.arange(0,70,1)

fig, ax = plt.subplots()

lamda = [3,10,50]
#print (enumerate(lamda))
for lamda_i,color_i,label_i in zip(lamda,["red","green","blue"],["lambda = 3","lambda = 10","lambda = 50"]):
    mu = lamda_i 
    #mean, var, skew, kurt = poisson.stats(mu, moments='mvsk')
    markerline, stemlines, baseline = ax.stem(tau, poisson.pmf(tau, mu), label = label_i,use_line_collection=True) #'bo', ms=8, label='poisson pmf')
    #ax.vlines(tau, 0, poisson.pmf(tau, mu), colors=color_i)
    markerline.set_markerfacecolor(color_i)
show_plot()
rm_plot()
#print (mu)

#Beta
lamda = 30
mean, var, skew, kurt = poisson.stats(lamda, moments='mvsk')
print ("For Lambda =",lamda," Mean =", mean, " Variance =", var)

#Gamma
lamda = [10,50]
fig, ax = plt.subplots()
conv = np.convolve(poisson.pmf(tau, lamda[0]),poisson.pmf(tau, lamda[1]))
markerline, stemlines, baseline = ax.stem(tau,poisson.pmf(tau, lamda[0]), label = "lambda = 10",use_line_collection=True)
markerline.set_markerfacecolor("green")
markerline, stemlines, baseline = ax.stem(tau,poisson.pmf(tau, lamda[1]), label = "lambda = 50",use_line_collection=True)
markerline.set_markerfacecolor("blue")
markerline, stemlines, baseline = ax.stem(conv, label = "Convolution",use_line_collection=True)
markerline.set_markerfacecolor("red")
show_plot()
rm_plot()
#print (len(poisson.pmf(tau, lamda[0])),len(conv))
#ax.stem
#delta
fig, ax = plt.subplots()
lamda = [30,60,90,120]
#Binom
k = np.arange(0,200,1)
n = lamda
p = [30/x for x in n]
print (p)
for n_i,p_i,color_i in zip(n,p,["red","green","blue","purple"]):
    markerline, stemlines, baseline = ax.stem(k, binom.pmf(k, n_i, p_i), label=('lamda = '+ str(n_i)),use_line_collection=True)
    markerline.set_markerfacecolor(color_i)
show_plot()
rm_plot()

#Ekthetikh katanomh
from scipy.stats import expon
#Alpha
def add_plot(x,y,label,color):
    ax.plot(x, y, color = color, label=label)
inv_lamda = [0.5,1,3]
colors = ["red","green","blue"]
fig, ax = plt.subplots()
tau = np.arange(0,8,0.00001)
for lamda_i,color_i in zip(inv_lamda,colors):
    add_plot(tau, expon.pdf(tau,0,lamda_i),"1/lamda = "+str(lamda_i),color_i)
show_plot()
rm_plot()

#Beta
fig, ax = plt.subplots()
for lamda_i,color_i in zip(inv_lamda,colors):
    add_plot(tau, expon.cdf(tau,0,lamda_i),"1/lamda = "+str(lamda_i),color_i)
show_plot()
rm_plot()

#Gamma
print ("Pr(X>30.000) = ",1-expon.cdf(tau[30000],0,2.5))
print ("Pr(X>50.000) = ",1-expon.cdf(tau[50000],0,2.5))
print ("Pr(X>20.000) = ",1-expon.cdf(tau[20000],0,2.5))
print ("Pr(X>50.000 | X>20.000) = ",(1-expon.cdf(tau[50000],0,2.5))/(1-expon.cdf(tau[20000],0,2.5)))

#Poisson Process
#Alpha
lamda = 5

grid = np.random.exponential(1/lamda,100)
#print ("This is MEAN",np.mean(grid))
grid = [sum(grid[0:i]) for i in range(100)]

fig, ax = plt.subplots()
ax.step(range(100), grid,label = "Poisson Process Counting", color = "red")
show_plot()
rm_plot()

for i in [2,3,5,10,100]:
    grid = np.random.poisson(lamda,i*100)
    print ("For Lambda = {}, mean is {}".format(i*100,np.mean(grid)))

#print (grid)