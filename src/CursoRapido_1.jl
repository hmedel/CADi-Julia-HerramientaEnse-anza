using Plots

### Con esto podemos comentar una línea

#=
Con esto podemos comentar
varias líneas.
Todas las líneas que quieran
=#

##################### Algunos atajos útiles en Editor
#=
Ejecutar código en REPL y moverse: Shift+Enter
Ejecutar código en REPL: Ctrl+Enter
=#

b = 1 + 3

A = rand(4,4)

### En el caso de una celda
# Ejecutar código de una celda en REPL: Alt+Enter
# Ejecutar código de una celda en REPL y moverse: Alt+Shift+Enter
# Limpiar resultados de la línea Clear Inline Results In Editor: Ctrl+I Ctrl+C

########### Algunos atajos útiles en terminal
# Limpiar terminal: Ctrl+l
# Interrumpir Ejecución: Ctrl+C
# Buscar en el historial: Ctrl+r

#############################
# Cargar un archivo y correrlo en terminal include("nombrearchivo")

######## Print
println("Hola todos!")

#### Símbolos matemáticos
# \símbolo(LaTeX)+tab
θ = π/2
ζ = π/6 

println(ζ)

## Operaciones
θ * ζ

#### Latexify.jl

############################# Variables y tipos
typeof(θ)
typeof("Hola")
typeof('j')
typeof(2)
typeof([1 2 3])
typeof([1,2,3,4,5])

typeof([1 2 3; 4 5 6; 7 8 9])

#### Jerarquía
#=
Number
│ 
├── Complex
│
├── Real
│
├── AbstractFloat
│  │
│  ├── BigFloat
│  │
│  ├── Float16
│  │
│  ├── Float32
│  │
│  └── Float64
│
├── AbstractIrrational
│  │
│  └── Irrational
│
├── Integer
│  │
│  ├── Bool
│  │
│  ├── Signed
│  │  │
│  │  ├── BigInt
│  │  │
│  │  ├── Int128
│  │  │
│  │  ├── Int16
│  │  │
│  │  ├── Int32
│  │  │
│  │  ├── Int64
│  │  │
│  │  └── Int8
│  │
│  └── Unsigned
│     │
│     ├── UInt128
│     │
│     ├── UInt16
│     │
│     ├── UInt32
│     │
│     ├── UInt64
│     │
│     └── UInt8     
│     
└── Rational
=#

#### Conversión de enteros a flotantes
Float64(2)
Float32(2)
Float16(2)

#### Convertir de flotante a entero
Int64(2.0)
Int64(2.4)
floor(Int64,2.4)
ceil(Int64,2.5)
round(Int64,2.3)

v = rand(3) .+ 1 ### Operador . hace operación elemento a elementos

ceil.(Int64,v) ## Función techo a cada elemento de v

########## Operaciones
## División
a = 1/2 ## División siempre regresa un Float64

div(10,3) ## división entera

rem(10,3) ### Residuo

##Ejemplo

A = rand(3,3)
B = rand(3,3)
C = A ./ B
D = A.\B

#### Operadores lógicos
# false
# true

Int(true)
Int(false)

true + true

# operadores 
# not    !x
# and    x&&y
# or     x||y

#Ejemplo

2 != 3
2 == 3

######################
#### Strings

# Concatenación
"hola" * "todos"
string("Hola", " ", "todos!")

#Convertir números a string
string(1/7)
"$(1/6)" ## Interpolación

"Podemos hacer esta operación 1/7 = $(1/7)"

using Printf
@sprintf("%6.4f",1/6)##Imprimir string con formato
@printf("%6.4f",1/6)

##########################
########## Bucles ########
##########################
# For, while, condicionales

#Ejemplo sencillo for 
x = 1:100
for i in x
println(i)
end

#Ejemplo sencillo con operación for
x = 0
for k ∈ 1:1000
    x = x + (1/k)^2
end
x

# Bucles anidados for
for i in 1:3
    for j in 1:3
        println("i = ",i," j = ",j, "\n")
    end
end

## equivalente
for i in 1:3, j in 1:3
    println("i = ",i," j = ",j)
end

##### Comandos break y continue 
# Nos sirve para romper o continuar con operaciones
# cuando se alcanza una condición

x = 0

for k in 1:100000
    term = (1/k)^2
    x = x + term
    if (abs(term)< 1e-10)
        break 
    end
end

#=
if condicion
    accion 1
elseif 
    accion 2
else
    accion 3
end
=#

#### Ejemplo while sencillo
a = 10
b =15
while a < b
    println(a)
    a +=1
end

### Ejemplo while con arreglo
arr = [1,2,3,4,5]
while !isempty(arr)
    println(pop!(arr))
end

### Ejemplo continue
for n in 1:10
    if 3<= n <= 6
        continue
    end
    println(n)
end


############################
######## Funciones #########
############################

#=
function f(argumentos)
    acciones
    return valor
end
=#

#Ejemplo
function sum_zeta(s,nterms)
    x = 0
    for n in 1:nterms
        x = x + (1/n)^s
    end
    return x
end

sum_zeta(2,100)

function sum_zeta(s::Int64,nterms::Int64)
    x = 0
    for n in 1:nterms
        x = x + (1/n)^s
    end
    return x
end

sum_zeta(2,10)

sum_zeta(2.0,10)

function sum_zeta(s::Float64,nterms::Int64)
    x = 0
    for n in 1:nterms
        x = x + (1/n)^s
    end
    return x
end

sum_zeta(2.0,10)

# Ejemplo Varios valores de salida
function multi(n,m)
    n*m,div(n,m), n%m
end

multi(8,9)

function multi2(n,m)
    n*m,div(n,m)
    return n%m, m
end

multi2(8,9)