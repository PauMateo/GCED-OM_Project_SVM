# PROBLEMA PRIMAL SVM. LAB ASSIGNMENT OM
# GABRIEL FORTUNY I PAU MATEO

param n;
param m;
param nu;

param A_train{1..m,1..n};
param y_train{1..m};

param A_test{1..m,1..n};
param y_test{1..m};

var w {1..n};
var gamma;
var s {1..m};

minimize primal:
	(1/2) * sum{p in {1..n}}(w[p]^2) + nu*sum{b in {1..m}}(s[b]);

subject to c1 {p in {1..m}}:
	-y_train[p]*(sum{b in {1..n}}(A_train[p,b]*w[b]) + gamma) -s[p] + 1 <= 0;	
subject to c2 {p in {1..m}}:
	-s[p] <= 0;