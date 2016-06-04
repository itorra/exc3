
library(igraph)
require(igraph)

grey.data = read.csv('ga_edgelist.csv',header = T)
grey_data =  graph.data.frame(grey.data,directed = F)

bet = betweenness(grey_data)
bet = sort(bet,decreasing = T)

names(bet[1])

close = closeness(grey_data)
close = sort(close, decreasing = T)

names(close[1])

eigen = evcent(grey_data)
eigen = sort(eigen$vector, decreasing = T)

names(eigen[1])

girvan = edge.betweenness.community(grey_data)

membership_girvan = membership(girvan)
plot(grey_data, vertex.size=7, vertex.label=NA,vertex.color=membership_girvan, asp=FALSE)

max(levels(as.factor(membership_girvan)))

summary(as.factor(membership_girvan))

girvan$modularity

multi = multilevel.community(grey_data)

membership_multi = membership(multi)
plot(grey_data, vertex.size=7, vertex.label=NA,vertex.color=membership_multi, asp=FALSE)

max(levels(as.factor(membership_multi)))

summary(as.factor(membership_multi))

multi$modularity
