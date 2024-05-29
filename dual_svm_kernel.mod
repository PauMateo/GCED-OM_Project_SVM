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
param sigma;



# Variables
var la {1..m} >=0, <= nu;

# Formulació del Dual -> optimització amb les dades de _train_
maximize dual:
	sum{i in {1..m}}la[i] 
	-(1/2)*sum{i in {1..m}, j in {1..m}}la[i]*y_train[i]*la[j]*y_train[j]*(exp(-(sum{k in {1..m}}( ((A_train[i,k]-A_train[j,k])^2) / (2*sigma^2) ));                               
	
subject to c1:
	sum{i in {1..m}}(la[i]*y_train[i]) = 0;