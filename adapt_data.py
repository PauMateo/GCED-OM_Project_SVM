import pandas as pd

A: list[list[float]] = []
y: list[float] = []
i: int = 0
j: int = 0
first = True
m = 1000
nu = 0.9
type = 'test'

path = 'data/'+type+'_'+str(m)

# Obrir un fitxer .dat en mode de lectura
with open(path + '.dat', 'rb') as fitxer:
    for linia in fitxer:
        dígits = linia.split()  # Separa els dígits de la linia utilitzant espais com a separadors
        for dígit in dígits:
            valor = float(dígit)  # Converteix el dígit a enter
            if i==4:
                i=0
                y.append(valor)
            else:
                i+=1
                if j==3:
                    A.append([valor])
                    j = 0
                    first = False
                else:
                    if first:
                        A.append([valor])
                        first = False
                    else:
                        A[len(A)-1].append(valor)
                        j += 1

# Obrir un fitxer .dat en mode d'escriptura
with open(path + '_svm.dat', 'w') as out:
    out.write('# ' + path+'\n')
    out.write(f"param m := {m};"+'\n')
    out.write('param n := 4;'+'\n')
    out.write(f'param nu := {nu};'+'\n')
    out.write('\n'+'\n'+'\n')

    out.write('param y_'+type +' := '+'\n')
    for i in range(len(y)):
        out.write(f'{i+1} {y[i]}' + '\n')
    out.write(';'+'\n'+'\n'+'\n')

    out.write('param A_'+type+' : 1 2 3 4 := '+'\n')
    for i in range(len(A)):
        out.write(f'{i+1} ')
        for j in range(4):
            out.write(f'{A[i][j]} ')
        out.write('\n')
    out.write(';'+'\n'+'\n'+'\n')



    


    