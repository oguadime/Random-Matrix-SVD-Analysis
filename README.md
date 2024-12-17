# Random-Matrix-SVD-Analysis
A MATLAB script to analyze the Singular Value Decomposition (SVD) of random matrices and quantify numerical differences in matrix reconstructions.

# Description 
This repository contains a MATLAB script that generates random matrices using orthogonal factors and random singular values. The script computes the SVD of each matrix and evaluates the differences between the original matrices and their reconstructions. It also calculates the condition numbers and visualizes the results.

## Code Overview
The script performs the following steps: 
- Random Matrix Generation: Generates random orthogonal matrices U and V using QR decomposition. Creates a diagonal matrix S with randomly sorted singular values.Constructs random matrices as A = U * S * V'.
- SVD and Reconstruction: Computes the SVD of each matrix (U2, S2, V2). Quantifies differences in Original and reconstructed U, V, and S, and Original matrix A and its reconstruction (U2 * S2 * V2').
- Condition Number: Calculates the condition number of each matrix.
- Visualization: Plots the differences in norms (\delta U, \delta V, \delta S, \delta A) for all generated matrices.

# Usage 
Run the script in MATLAB:
```matlab
% Random Matrix SVD Analysis
% Execute the script to analyze 100 random matrices and visualize results.
```

## License
This project is licensed under the MIT License - see the LICENSE file for details.
```
Feel free to adjust any part of this README to better fit your specific needs or preferences.
