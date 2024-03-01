# Stability in Practice of Gaussian elimination.

In reading 22 of the numerical linear algebra book, an example is presented illustrating how Gaussian elimination can be unstable for certain matrices. It poses the question: how is it possible for such a reliable and widely-used code to fail with certain matrices?

The answer lies in statistics.

The book states: "One can learn more about this phenomenon by considering random matrices. Of course, the matrices that arise in applications are not random in any ordinary sense. They have all kinds of special properties, and if one tried to describe them as random samples from some distribution, it would have to be a curious distribution indeed. It would certainly be rare in applications. If we can show that they are vanishingly rare among random matrices in some well-defined class, the mechanisms involved must surely be the same. The argument does not depend on one measure of "vanishingly" agreeing with the other to any particular factor such as 2 or 10 or 100."

In the Matlab code (), an experiment is presented with matrices generated randomly (a random matrix to be an mxm matrix whose entries are independent samples from the real normal distribution with mean zero and standard deviation m^(1/2)), and the growth factor is calculated defined as:
rho = max |uij| / max |aij|, where u is the reduced matrix of A using Gaussian elimination with partial pivoting. If rho is of order 1, the elimination process is stable. If rho is much larger than 1, instability is expected.

![ratiovsm](https://github.com/tin7/Stability-in-Practice-of-Gaussian-elimination/assets/87256238/bbd40b6d-18b3-4c51-b719-e4c61550f4f8)
