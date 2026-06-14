function updateValueReferent!(particle)
    sum = 0.0
    for i in 1:length(particle.values)
        sum += abs(particle.values[i])
    end
    particle.currentValue = sum
end

function generateReferentParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:maxRang, numberOfOperands), 0.0,
                        fill(0.0, numberOfOperands), fill(0.0, numberOfOperands), 0.0)

    updateValueReferent!(particle)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue
    return particle
end