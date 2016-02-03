aseries(N, S) :- S is (-1)^(floor((1/2)*N))*3*(5^N).
cheatSum(B, S) :- N is floor(B^(1/3)), S is (N*B - ((1/4)*((N)^2)*((N+1)^2))).