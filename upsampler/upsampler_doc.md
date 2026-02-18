# Upsampler
## Overview
An L-fold upsampler, also known as an expander, is used in digital signal processing to widen "shrink" or "squeeze" the digital spectrum of a signal. This is achieved by placing L-1 zeros between every pair of consecutive samples of the signal. More formally,
$$
y_{L}[n] = 
\begin{cases}
x[n] & \text{if } n = pL \; \text{where} \; p \in \mathbb{Z^+}\\
0 & \text{otherwise}
\end{cases}
$$

## Architecture
The upsampler can be thought of as an L-state finite state machine (FSM). The input to the FSM must remain fixed throughout each cycle of the FSM. The output of the FSM equals the input in **only one** state of the FSM, while the outputs of the remaining (L-1) states is 0. 

Consider: $N = \lceil{log_2(L)}\rceil$. Then an N-bit counter can be used to represent the FSM. Since it is possible for $L < 2^N$, an equality checker circuit can be used to compare the counter value with (L-1) and trigger the reset signal of the counter, with reset taking the counter value to 0. Although any arbitrary state can be chosen to be the state the passes the input to the output, I have chosen the zero state. To know if the counter is in the zero state, a simple $N$-input NOR gate would suffice, which can be AND-gated with the input bits to produce the output. The diagram given below shows the architecture for a 3-fold upsampler designed using the same ideas:



**\*Note:** The input format can be anything, i.e. a floating-point real value, a complex floating-point vector, fixed point representations, etc.
