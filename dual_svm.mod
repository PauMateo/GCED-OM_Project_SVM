# PROBLEMA PRIMAL SVM. LAB ASSIGNMENT OM
# GABRIEL FORTUNY I PAU MATEO


# Paràmetres
param n;
param m;
param nu;

param y_train {1..m};
param A_train {1..m,1..n}; 

param y_test {1..m};
param A_test {1..m}{1..m};


# Variables
var la {1..m} >=0, <= nu;

# Formulació del Dual -> optimització amb les dades de _train_
maximize dual:
	sum{i in {1..m}}la[i] 
	-(1/2)*sum{i in {1..m}, j in {1..m}}la[i]*y_train[i]*la[j]*y_train[j]*(sum{k in {1..n}}A_train[i,k]*A_train[j,k]);
	
subject to c1:
	sum{i in {1..m}}(la[i]*y_train[i]) = 0;