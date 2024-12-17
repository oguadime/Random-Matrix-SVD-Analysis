format long

% Initialize storage for results
numberofmatrices = 100; % Number of random matrices to generate
normU = zeros(numberofmatrices, 1);
normV = zeros(numberofmatrices, 1);
normS = zeros(numberofmatrices, 1);
normA = zeros(numberofmatrices, 1);
condA = zeros(numberofmatrices, 1); 

for i = 1:numberofmatrices
    % Step 1: Generate random orthogonal matrices U and V
    [U, ~] = qr(randn(50));
    [V, ~] = qr(randn(50));
    
    % Step 2: Generate diagonal matrix S with random sorted singular values
    S = diag(flipud(sort(rand(50, 1))));
    
    % Step 3: Construct matrix A = U * S * V'
    A = U * S * V';
    
    % Step 4: Compute SVD of A
    [U2, S2, V2] = svd(A);
    
    % Step 5: Compute norms
    normU(i) = norm(U - U2);
    normV(i) = norm(V - V2);
    normS(i) = norm(S - S2);
    normA(i) = norm(A - U2 * S2 * V2');

    % Compute condition number of A
    condA(i) = cond(A);
    
    % Print results for this matrix
    fprintf('Matrix %d:\n', i);
    fprintf('  Norm(U - U2): %e\n', normU(i));
    fprintf('  Norm(V - V2): %e\n', normV(i));
    fprintf('  Norm(S - S2): %e\n', normS(i));
    fprintf('  Norm(A - U2 * S2 * V2^T): %e\n\n', normA(i));
    fprintf('  Condition Number (cond(A)): %e\n\n', condA(i));
end

% Plotting norms
figure;
semilogy(normU, 's-', 'DisplayName', '\delta U'); 
hold on;
semilogy(normV, 'x-', 'DisplayName', '\delta V');
semilogy(normS, 'o-', 'DisplayName', '\delta S');
semilogy(normA, '*-', 'DisplayName', '\delta A');
legend('\delta U', '\delta V', '\delta S', '\delta A');
title('Norm Differences for Random Matrices');
xlabel('Matrix Index');
ylabel('Norm Difference');
hold off;
