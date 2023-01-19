"""
    flecha(x0, y0, z0, xf, yf, zf; cl = :white)

Draws an arrow corresponding to the given input vector """
function flechasimple(x0, y0, z0, fx, fy, fz; cl = :white)

    # Location of the field
    xi=x0
    yi=y0
    zi=z0

    # Magnitude of the field
    F = sqrt(fx^2 + fy^2 + fz^2)

    # Final coordinates
    xf = xi + 0.8fx
    yf = yi + 0.8fy
    zf = zi + 0.8fz

    # Head arrows
    pointxx = 8
    xxmax = 0.2
    tp = collect(range(0.0,length=pointxx,stop=xxmax))
    ss = cat(50tp,4,dims=1)

    xif = xf .+ fx.*tp
    yif = yf .+ fy.*tp
    zif = zf .+ fz.*tp

    xp = cat(xi, xif, dims=1)
    yp = cat(yi, yif, dims=1)
    zp = cat(zi, zif, dims=1)

    plot3d!(xp, yp, zp, linewidth=ss[end:-1:1],
                color = cl)

end

"""
    ejes(winsize; cl=:white)

Generates axis of the given size and color """
function ejes(winsize; multi=35, cl = :white, xxmax = 0.1)
    # Draw axis to overcome weird scaling behaviour
    pointxx = 10
    tp = collect(range(0.0,length=pointxx,stop=xxmax))
    ss = cat(winsize*multi*tp,1,1,dims=1)
    a1 = cat(-winsize, winsize, winsize.*(0.9.+tp), dims=1)
    a2 = zeros(pointxx+2)
    a3 = zeros(pointxx+2)
    plot3d!(a1, a2, a3, color=cl, linewidth=ss[end:-1:1])  # X-axis
    plot3d!(a2, a1, a3, color=cl, linewidth=ss[end:-1:1])  # Y-axis
    plot3d!(a2, a3, a1, color=cl, linewidth=ss[end:-1:1])  # Z-axis
end