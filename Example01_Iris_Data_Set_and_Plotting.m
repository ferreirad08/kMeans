%Examples using Iris Data Set and Plotting

load fisheriris

k = 3; % Number of clusters
X = meas(:,3:4);
mdl = kMeans(k).fit(X);

Xnew = [min(X);mean(X);median(X);max(X)]
Ypred = mdl.predict(Xnew)

hold on
plot(X(1:50,1),X(1:50,2),'o') % Only setosas
plot(X(51:100,1),X(51:100,2),'o') % Only versicolors
plot(X(101:150,1),X(101:150,2),'o') % Only virginics
plot(Xnew(:,1),Xnew(:,2),'xk')
plot(mdl.C(:,1),mdl.C(:,2),'s')

legend({'setosa','versicolor','virginica','new instances','centroids'},'Location','northwest')
title(strcat('kMeans (k = 3)'))

axis equal
hold off
saveas(gca, 'Clustering_results', 'png')
