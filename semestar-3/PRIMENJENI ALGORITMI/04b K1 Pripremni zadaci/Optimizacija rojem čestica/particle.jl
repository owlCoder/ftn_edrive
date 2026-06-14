mutable struct Particle 
    values::Array{Float64}
    currentValue::Float64
    velocity::Array{Float64, 1}
    bestValues::Array{Float64, 1}
    bestValue::Float64
end

function updateValue!(particle, X)
    sum = 0.0
    for i in 1:length(particle.values)
        sum += abs(particle.values[i] - X.values[i])
    end
    particle.currentValue = sum
end

function generateParticle(numberOfOperands, minRang, maxRang, X)
    particle = Particle(rand(minRang:maxRang, numberOfOperands), 0.0,
                        fill(0.0, numberOfOperands), fill(0.0, numberOfOperands), 0.0)

    updateValue!(particle, X)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue
    return particle
end

function printParticle(particle)
    for i in 1:length(particle)
        print(particle.values[i], " ")
    end
    println(particle.currentValue)
end

# Vi = Cv*Vi + Cp*Rp*(Pi-Xi) + Cg*Rg*(g-Xi)
# Xi - trenutna vrednost
# Pi - lokalno najbolja
# g  - globalno najbolja
# Cv = 1 Cp = 2 Cg = 2
function updateVelocity!(particle, globalBestParticle, maxVelocity, X)
    rp = rand(Float64)
    rg = rand(Float64)

    for i in 1:length(particle.velocity)
        particle.velocity[i] = 1.0 * particle.velocity[i] +
                               2.0 * rp * (particle.bestValues[i] - particle.values[i]) +
                               2.0 * rg * (globalBestParticle.values[i] - particle.values[i])
        if particle.velocity[i] > maxVelocity
            particle.velocity[i] = maxVelocity
        elseif particle.velocity[i] < -maxVelocity
            particle.velocity[i] = -maxVelocity
        end
    end
end

function updatePosition!(particle, targetValue, X)
    for i in 1:length(particle.values)
        particle.values[i] += particle.velocity[i]

        if particle.values[i] > 1
            particle.values[i] = 1.0
        elseif particle.values[i] < -1
            particle.values[i] = -1.0
        end
    end
    updateValue!(particle, X)

    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values)
        particle.bestValue = particle.currentValue
    end
end
