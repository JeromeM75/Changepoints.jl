# Checks PELT runs

println("Running PELT tests...")

n = 1000;        # Number of samples
λ = 100;         # Frequencey of changes

########################
# Normal mean segments #
########################
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
seg_costs = NormalMeanSegment(sample);
PELT(seg_costs, n);

#######################
# Normal var segments #
#######################
μ, σ = 1.0, Uniform(2.0, 15.0)
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
seg_costs = NormalVarSegment(sample, μ)
PELT(seg_costs, n)

############################
# Exponential changepoints #
############################
# Generate sample
μ = Uniform(0.0, 10.0)
sample, cps = @changepoint_sampler n λ Exponential(μ)
seg_costs = ExponentialSegment(sample)
PELT(seg_costs, n)

# Integer output not currently compatable with ChangepointSampler

## ###
## # Poisson changepoints
## ###

## # Generate sample
## μ = Uniform(0.0, 10.0)
## Y = ChangepointSampler(()->Poisson(rand(μ)), λ)
## sample = rand(Y, n)

## # Run PELT
## seg_costs = PoissonSegment(sample)
## PELT(seg_costs, n)
