using DataFrames
using CSV
using StatsBase
using Plots, StatsPlots
using ROC
using GLM
using Lathe

data = DataFrame(CSV.File("krediti.csv"))
display(describe(data))

# display(countmap(data[!, :Gender]))
data[ismissing.(data[!, :Gender]), :Gender] .= mode(skipmissing(data[!, :Gender]))

# display(countmap(data[!, :Married]))
data[ismissing.(data[!, :Married]), :Married] .= mode(skipmissing(data[!, :Married]))

# display(countmap(data[!, :Dependents]))
data[ismissing.(data[!, :Dependents]), :Dependents] .= mode(skipmissing(data[!, :Dependents]))

# display(countmap(data[!, :Self_Employed]))
data[ismissing.(data[!, :Self_Employed]), :Self_Employed] .= mode(skipmissing(data[!, :Self_Employed]))

# display(countmap(data[!, :LoanAmount]))
data[ismissing.(data[!, :LoanAmount]), :LoanAmount] .= trunc(Int64, mean(skipmissing(data[!, :LoanAmount])))

# display(countmap(data[!, :Loan_Amount_Term]))
data[ismissing.(data[!, :Loan_Amount_Term]), :Loan_Amount_Term] .= trunc(Int64, mean(skipmissing(data[!, :Loan_Amount_Term])))

# display(countmap(data[!, :Credit_History]))
data[ismissing.(data[!, :Credit_History]), :Credit_History] .= trunc(Int64, mean(skipmissing(data[!, :Credit_History])))

fm = @formula(Loan_Status ~ Gender + Married + Dependents + Education + Self_Employed + ApplicantIncome + CoapplicantIncome + LoanAmount + Loan_Amount_Term + Credit_History)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(data, .80)
logisticRegressor = glm(fm, dfTrain, Binomial(), ProbitLink())
dataPredictedTest = predict(logisticRegressor, dfTest) 

dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))
for i in 1:length(dataPredictedTest)
    if dataPredictedTest[i] < 0.5
        dataPredictedTestClass[i] = 0
    else
        dataPredictedTestClass[i] = 1
    end
end

FPTest = 0
FNTest = 0
TPTest = 0
TNTest = 0

for i in 1:length(dataPredictedTestClass)
    if dfTest.Loan_Status[i] == 1 && dataPredictedTestClass[i] == 1
        global TPTest += 1
    elseif dfTest.Loan_Status[i] == 0 && dataPredictedTestClass[i] == 0
        global TNTest += 1
    elseif dfTest.Loan_Status[i] == 0 && dataPredictedTestClass[i] == 1
        global FPTest += 1
    elseif dfTest.Loan_Status[i] == 1 && dataPredictedTestClass[i] == 0
        global FNTest += 1
    end
end

accuracy     = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest)
sensitivity  = (TPTest) / (TPTest + FNTest)
specificity  = (TNTest) / (TNTest + FPTest)

println("\n\nACCURACY: $accuracy\nSENSITIVITY: $sensitivity\nSPECIFICITY: $specificity\n")

rocTest = ROC.roc(dataPredictedTest, dfTest.Loan_Status, true)
aucTest = AUC(rocTest)

if aucTest > 0.9
    println("JAKO DOBAR")
elseif aucTest > 0.8
    println("VEOMA DOBAR")
elseif aucTest > 0.7
    println("DOSTA DOBAR")
elseif aucTest > 0.5
    println("RELATIVNO DOBAR")
else
    println("NIJE DOBAR")
end
