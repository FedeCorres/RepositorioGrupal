# Introducción a la programación
# Ejericio nº 2:

Dueno = [28957346, "Juan", "Perez", 4789689, "Belgrano 101"]
for elemento in Dueno:
    if Dueno.index(elemento) != 0 and Dueno.index(elemento) != 2:
        print(elemento)
