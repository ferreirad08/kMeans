# k-Means (kM) Clustering
Multiple Clusters with the kM and Initialization via k-Means++

Function
1. kMeans.predict(Xnew)

Description
1. Returns the estimated clusters of one or multiple test instances.

Example

    X = [[1, 2]; [1, 4]; [1, 0];[10, 2]; [10, 4]; [10, 0]];
    Xnew = [[0, 0]; [12, 3]];
    k = 2;

    mdl = kMeans(k);
    mdl = mdl.fit(X);
    Ypred = mdl.predict(Xnew)

    Ypred =

    1
    2

    centroids = mdl.C

     1 2
    10 2

See examples in the script files.
