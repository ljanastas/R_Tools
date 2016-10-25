# CLT
# Simulation demonstration of the Central Limit Theorem useful for intro 
# statistics classes

Sample.Means<-c()
MaleFemaleUniverse<-rbinom(100000,1,.5)

par(mfrow=c(1,3))

# Sample, N = 25 people from the Universe and take sample mean 100 times
for(i in 1:100){
  Sample.Means<-c(Sample.Means,
                  mean(sample(MaleFemaleUniverse,25)
                  ))
}

# Plot sample means, 100 samples, N = 25 observations/sample
hist(Sample.Means, main=" ",
     xlab = "Sample Means, N=25")

# Sample, N = 1000 people from the Universe and take sample mean 100 times
for(i in 1:100){
  Sample.Means<-c(Sample.Means,
                  mean(sample(MaleFemaleUniverse,1000)
                  ))
}

# Plot sample means, 1000 samples, N = 25 observations/sample
hist(Sample.Means, main=" ",
     xlab = "Sample Means, N=1000")

# Sample, N = 1000 people from the Universe and take sample mean 100 times
for(i in 1:100){
  Sample.Means<-c(Sample.Means,
                  mean(sample(MaleFemaleUniverse,10000)
                  ))
}

# Plot sample means, 1000 samples, N = 25 observations/sample
hist(Sample.Means, main=" ",
     xlab = "Sample Means, N=10000")


