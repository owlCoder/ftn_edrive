function solve_quadric_equation(a, b, c)
    if a == 0
        error("Equation not defined!")
    elseif calculate_determinant(a, b, c) == 0
        return (-b / 2 * a);
    else
        return calculate_equation(a, b, c);
    end    
end

function calculate_determinant(a, b, c)
    pre_det = b * b - 4 * a * c;
    if pre_det < 0
        return sqrt(Complex(pre_det));
    else
        return sqrt(pre_det);
    end    
end

function calculate_equation(a, b, c)
    determinant = calculate_determinant(a, b, c);
    x1 = (-b + determinant) / (2 * a);
    x2 = (-b - determinant) / (2 * a);
    return x1, x2;
end

function test_jl()
    println("\nUnesite koeficijent a: ");
    a_str = readline();
    
    if parse(Float64, a_str) != 0
        println("\nUnesite koeficijent b: ");
        b_str = readline();

        println("\nUnesite koeficijent c: ");
        c_str = readline();

        a = parse(Float64, a_str);
        b = parse(Float64, b_str);
        c = parse(Float64, c_str);

        x1, x2 = solve_quadric_equation(a, b, c);
        print("\nRešenje/a kvadratne jednačine su:\n\tx1 = ", 
                round(x1, digits = 2), "\n\tx2 = ", round(x2, digits = 2));
    else
        error("Equation not defined!")
    end
end

test_jl();
