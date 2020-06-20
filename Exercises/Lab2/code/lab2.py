import matplotlib.pyplot as plt
import numpy as np
import ciw
import random
from scipy.stats import poisson 
mu = 5
"""
class PoissonDist(ciw.dists.Distribution):
    def sample(self, t=None, ind=None):
        global mu  
        return poisson.rvs(mu)
averageWait = []        
for ml in np.arange(5,10.1,0.01):
    N = ciw.create_network(
        arrival_distributions=[PoissonDist()],
        service_distributions=[ciw.dists.Exponential(1/ml)],
        number_of_servers=[1]
    )

    #ciw.seed(2020)
    Q = ciw.Simulation(N)
    Q.simulate_until_max_time(2000)

    recs = Q.get_all_records()
    waits = [r.waiting_time for r in recs]
    averageWait.append( sum(waits) / len(waits))
"""
resul = []
for mu in range(1,10):
    pois = np.random.poisson(5,10000)
    pois = sum(pois)
    expo = np.random.exponential(mu,10000)
    auth = [abs(x-y) for x,y in zip(pois,expo)]


mylist = [x for x in np.arange(5,10.1,0.01)]
#print (mylist[::-1])
fig, ax = plt.subplots(1, 1)
ax.plot(mylist[::-1], averageWait)
plt.xlabel("$\mu$")
plt.ylabel("$E(T)$")
plt.title("Expected waiting time based on $\mu$")
plt.show()
#print (recs)

