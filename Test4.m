% Number of nodes
numNodes = 10;


% Number of layers
layers = 4;








DegMat = eye(numNodes);


% Initialize a 3D array for the multiplex graph adjacency matrix
multiplexAdjMatrix = zeros(numNodes, numNodes, layers);
a = zeros(numNodes, numNodes);
% Create potential connections between corresponding nodes in each layer
for i = 1:layers
    % Generate a random binary matrix for potential connections
    potentialConnections = randi([0, 1], numNodes, numNodes);
    
    % Ensure symmetry (assuming an undirected graph)
    potentialConnections = triu(potentialConnections, 1) + triu(potentialConnections, 1)';
    
    % Set the adjacency matrix for the current layer
    multiplexAdjMatrix(:, :, i) = potentialConnections;
    a = potentialConnections;
    DegMat = DegMat + potentialConnections;
end

FinalMat = numNodes.* ones(1,numNodes)
1:numNodes
DegMat



for i = 1:numNodes
    numZeros = sum(DegMat(:, i) == 0);
    FinalMat(1,i)  = FinalMat(1,i) - numZeros
end
Degree_Centrality_Of_Each_Node = FinalMat


% Display each layer of the multiplex graph and adds degree for each layer
for i = 1:layers
    subplot(2, 2, i);
    G = graph(multiplexAdjMatrix(:, :, i));
    degreeCentrality = centrality(G, 'degree');
    degreematrix(i,:) = degreeCentrality;
    plot(G, 'NodeLabel', 1:numNodes, 'Layout', 'circle');
    title(['Layer ' num2str(i)]);
end


% finds the maximum degree of each layer 
Max_Degree_Of_Each_Node_On_Layer = max(degreematrix)