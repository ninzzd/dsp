## Overview
An upsampler, also known as an expander, is used in digital signal processing to widen "shrink" or "squeeze" the digital spectrum of a signal. This is achieved by placing L-1 zeros between every pair of consecutive samples of the signal. More formally,
$$
y_{L}[n] = 
\begin{cases}
x[n] & \text{if } n = pL \; \text{where} \; p \in \mathbb{Z}\\
0 & \text{otherwise}
\end{cases}
$$
