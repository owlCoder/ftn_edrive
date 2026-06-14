mutable struct Particle
    values::Array{Int64, 1}
    currentValue::Int64
    velocity::Array{Float64, 1}
    bestValues::Array{Float64, 1}
    bestValue::Int64
end

function updateValue!(particle)
    sum = 0
    for i in 1:length(particle.values)
        sum += particle.values[i]
    end
    particle.currentValue = sum
end

function generateParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:maxRang, numberOfOperands),
                        0, fill(0.0, numberOfOperands),
                        fill(0.0, numberOfOperands), 0)
    updateValue!(particle)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue

    return particle
end

function printParticle(particle)
    for i in 1:length(particle.values)
        if i < length(particle.values)
            print(particle.values[i], " + ")
        else
            print(particle.values[i], " = ")
        end
    end
    println(particle.currentValue)
end

# Vi = Cv*Vi + Cp*Rp*(Pi-Xi) + Cg*Rg*(g-Xi)
# Xi - trenutna vrednost
# Pi - lokalno najbolja
# g - globalno najbolja
# Cv = 1 Cp = 2 Cg = 2
function updateVelocity!(particle, globalBestParticle, maxVelocity)
    Rp = rand(Float64)
    Rg = rand(Float64)
    Cv = 1.0
    Cp = 2.0
    Cg = 2.0

    for i in 1:length(particle.velocity)
        particle.velocity[i] = Cv * particle.velocity[i] + 
                            Cp * Rp * (particle.bestValues[i] - particle.values[i]) +
                            Cg * Rg * (globalBestParticle.values[i] - particle.values[i])
        if particle.velocity[i] > maxVelocity
            particle.velocity[i] = maxVelocity
        elseif particle.velocity[i] < -maxVelocity
            particle.velocity[i] = -maxVelocity
        end
    end
end

function updatePosition!(particle, targetValue)
    for i in 1:length(particle.values)
        particle.values[i] += trunc(Int64, particle.velocity[i])

        if particle.values[i] < 0
            particle.values[i] = -particle.values[i] + (-particle.values[i] % 2)

            if particle.values[i] ∈ particle.values # ako postoji duplikat - randomizuj
                particle.values[i] = rand(particle.values[i]:(targetValue - particle.values[i] - rand(1:25)))
            end
        end
    end
    updateValue!(particle)

    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values)
        particle.bestValue = particle.currentValue
    end
end