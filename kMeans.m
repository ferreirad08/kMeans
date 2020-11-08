classdef kMeans
%k-Means (kM)
%
% Author: M.Sc. David Ferreira - Federal University of Amazonas
% Contact: ferreirad08@gmail.com
% Date: August 2020

properties
    k = 2 % Number of clusters
    C = [] % Centroids of each cluster
    idx
end
methods
    function obj = kMeans(arg1)
        if nargin > 0
            if isscalar(arg1)
                obj.k = arg1;
            else
                obj.C = arg1;
                obj.k = size(arg1,1);
            end
        end
    end
    function obj = fit(obj,X)
        % Initializing clusters by the k-means++ algorithm
        if isempty(obj.C)
            Xcopy = X;
            i = randi(size(Xcopy,1));
            obj.C(1,:) = Xcopy(i,:);
            Xcopy(i,:) = [];
            for j = 2:obj.k
                % Euclidean distance matrix
                D = pdist2(Xcopy,obj.C).^2;
                [~,i] = max(min(D,[],2));
                obj.C(j,:) = Xcopy(i,:);
                Xcopy(i,:) = [];
            end
        end
        
        % Convergence
        Cnew = zeros(size(obj.C));
        while 1
            % Associate each instance with the closest centroid
            obj.idx = predict(obj,X);
            % Recalculate each centroid using all instances associated with it
            for j = 1:obj.k
                Cnew(j,:) = mean(X(obj.idx == j,:));
            end
            
            % Break, if no instances change of associated centroid
            if obj.C == Cnew, break, end
            obj.C = Cnew;
        end
    end
    function Ypred = predict(obj,Xnew)
        % Euclidean distance matrix
        D = pdist2(Xnew,obj.C);
        % Associate each instance with the closest centroid
        [~,Ypred] = min(D,[],2);
    end
end
end
