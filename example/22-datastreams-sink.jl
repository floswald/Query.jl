using Query
using DataFrames
using DataStreams
using CSV
using Feather

df = DataFrame(name=["John", "Sally", "Kirk"], age=[23., 42., 59.], children=[3,5,2])

x = @from i in df begin
    @select i
    @collect CSV.Sink("test-output2.csv")
end
Data.close!(x)

x = @from i in df begin
    @select i
    @collect Feather.Sink("test-output2.feather")
end
Data.close!(x)
