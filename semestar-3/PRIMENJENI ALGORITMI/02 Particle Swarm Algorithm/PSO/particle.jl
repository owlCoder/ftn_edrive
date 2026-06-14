mutable struct Particle
    values::Array{Int64, 1}
    currentValue::Int64
    velocity::Array{Float64, 1}
    bestValues::Array{Int64, 1}
    bestValue::Int64
end

function updateValue!(particle)
    particle.currentValue = 0
    for i in 1:length(particle.values)
        particle.currentValue += particle.values[i]
    end
end

function generateParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:maxRang, numberOfOperands), 0, 
                        fill(0.0, numberOfOperands), fill(0, numberOfOperands), 0)
    updateValue!(particle)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue
    return particle
end

function printParticle(particle)
    for j in 1:length(particle.values)
        if j < length(particle.values)
            print(particle.values[j], " + ")
        else 
            print(particle.values[j], " = ")
        end
    end
    println(particle.currentValue)
end

# Vi = Cv*Vi + Cp*Rp*(Pi-Xi) + Cg*Rg*(g-Xi)
# Cv = 1; Cp, Cg = 2
function updateVelocity!(particle, globalBestParticle, maxVelocity)
    for i in 1:length(particle.values) 
        particle.velocity[i] +=  2.0 * rand(0:0.1:1) * (particle.bestValues[i] - particle.values[i]) + 
                                 2.0 * rand(0:0.1:1) * (globalBestParticle.values[i] - particle.values[i])
        
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
    end

    updateValue!(particle)
    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values)
        particle.bestValue = particle.currentValue
    end
end