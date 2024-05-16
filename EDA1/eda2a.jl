using CSV;
using DataFrames;
include("bubble_sort.jl")
include("inserction_sort.jl")
using .buble
using .inserction


#import .sorting

# Read the data from the file "
#file = "data/flights.csv";
#df = CSV.File(file, delim=",") |> DataFrame!;
#println("\nData description: \n", df);

# Call the function to perform EDA


data = CSV.read("EDA1/file.csv", DataFrame);

data_copy_to_buble = copy(data);
data_copy_to_inserction = copy(data);

bubble_sort(data_copy_to_buble.numero)
insertion_sort(data_copy_to_inserction.numero)

# Bubble Sort
#bubble_sort(data_copy_to_buble.numero);
#insertion_sort(data_copy_to_inserction.numero);

println(data_copy_to_buble.numero)
println(data_copy_to_inserction.numero)