using Plots  # Importamos el paquete Plots para la visualización de los resultados

# Parámetros del problema
alpha = 0.01  # Difusividad térmica
L = 1.0       # Longitud del dominio espacial
T = 0.1       # Tiempo total de la simulación
nx = 50       # Número de puntos en la discretización espacial
nt = 100      # Número de pasos de tiempo

# Discretización del dominio
dx = L / (nx-1)  # Tamaño del paso espacial
dt = T / nt      # Tamaño del paso temporal
x = range(0, stop=L, length=nx)  # Vector de puntos en el dominio espacial
u = zeros(nx)          # Vector para almacenar la solución en cada punto espacial
unew = zeros(nx)       # Vector temporal para actualizar la solución

# Condiciones iniciales
u .= sin.(pi * x)  # Condición inicial: una onda sinusoidal

# Solución numérica utilizando el método de diferencias finitas
for n in 1:nt  # Iteración sobre cada paso de tiempo
    for i in 2:nx-1  # Iteración sobre cada punto espacial (excepto los bordes)
        # Aplicación del esquema de diferencias finitas
        unew[i] = u[i] + alpha * dt / dx^2 * (u[i+1] - 2*u[i] + u[i-1])
    end
    u .= unew  # Actualización de la solución
end

# Visualización de los resultados
plot(x, u, title="Solución de la Ecuación de Difusión-Calor", xlabel="x", ylabel="u", lw=2)