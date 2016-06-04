# Chunk 1
library(igraph)
require(igraph)
# Chunk 2: Intro
eue.data = read.csv('eur.csv',header = F)
eur_data =  graph.data.frame(eue.data,directed = F)
# Chunk 3: Remove Self loops
eur_data = simplify(eur_data)
# Chunk 4: Betweeness1-Prep
bet = betweenness(eur_data)
bet = sort(bet,decreasing = T)
# Chunk 5: Betweeness1-Res
names(bet[1])
# Chunk 6: Closeness1-Prep
close = closeness(eur_data)
close = sort(close, decreasing = T)
# Chunk 7: Closeness1-Res
names(close[1])
# Chunk 8: Eigenvector1-Prep
eigen = evcent(eur_data)
eigen = sort(eigen$vector, decreasing = T)
# Chunk 9: Eigenvector1-Res
names(eigen[1])
# Chunk 10: Girvan-Newman
girvan = edge.betweenness.community(eur_data)
# Chunk 11: Girvan-Newman-Plot
membership_girvan = membership(girvan)
plot(eur_data, vertex.size=7, vertex.label=NA,vertex.color=membership_girvan, asp=FALSE)
# Chunk 12: Girvan-Newman-Community
max(levels(as.factor(membership_girvan)))
# Chunk 13: Girvan-Newman-Sum
summary(as.factor(membership_girvan))
# Chunk 14: Girvan-Newman-Mod
girvan$modularity
# Chunk 15: Multi-Level
multi = multilevel.community(eur_data)
# Chunk 16: Multi-Level-Plot
membership_multi = membership(multi)
plot(eur_data, vertex.size=7, vertex.label=NA,vertex.color=membership_multi, asp=FALSE)
# Chunk 17: Multi-Level-Comm
max(levels(as.factor(membership_multi)))
# Chunk 18: Multi-Level-Sum
summary(as.factor(membership_multi))
# Chunk 19: Multi-Level-Mod
multi$modularity
