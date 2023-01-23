# Suma de vectores

using Plots
# plotlyjs()

# A = [Ax, Ay]
Ax = 1.0
Ay = 0.5

# B = [Bx, By]
Bx = 2.0
By = 2.0

# Primer vector
p1 = plot()
p1 = plot!([0.0, Ax], [0.0, Ay],
    color = :red,
    arrow = true)

# Segundo vector
p1 = plot!([Ax, Ax+Bx], [Ay, Ay+By],
    color = :blue,
    arrow = true)

# Vector resultante
Rx = Ax+Bx
Ry = Ay+By
p1 = plot!([0.0, Rx], [0.0, Ry],
    color = :orange,
    arrow = true)

# Primer vector
p2 = plot()
p2 = plot!([0.0, Ax], [0.0, Ay],
    color = :red,
    arrow = true)

# Segundo vector
p2 = plot!([0.0, Bx], [0.0, By],
    color = :blue,
    arrow = true)

# Vector resultante
Rx = Ax+Bx
Ry = Ay+By
p2 = plot!([0.0, Rx], [0.0, Ry],
    color = :orange,
    arrow = true)

# Dos graficas
 
plot(p1)

plot(p2, reuse=false)

# Misma ventana
plot(p1, p2, reuse=false)

function campo(x,y)
    Ex = x*y
    Ey = x+y
    return Ex,Ey
end

function campo2(x,y)
    Ex = x.*y
    Ey = x.+y
    return Ex,Ey
end

xs = collect(range(-1.0, 1.0, length=8))
ys = xs'

C = campo.(xs,ys)
C2 = campo2(xs,ys)