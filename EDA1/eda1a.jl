
using Plots
using Random
using Distributions
include("bubble_sort.jl")
using .buble
include("inserction_sort.jl")
using .inserction




function time_sort(n, time_total, sort_algorithm::Function)
    dist = Normal(0.0, 1.0);  # standard normal distribution
    
    for j in 1:25 
        time_array = zeros(Float64, n);
        for i in 1:25
            A = rand(dist, n)      # generate an array of n random numbers from a standard normal distribution
            time_initial = time()
            sort_algorithm(A)
            time_final = time()
            time_array[i] = time_final - time_initial
        end
        
        time_total[j] = mean(time_array)
        n += 1000
    end
    
end

amostra = 3000
time_bubble_sort = zeros(Float64, 25)
time_insertion_sort = zeros(Float64, 25)

time_sort(amostra, time_bubble_sort ,  bubble_sort)
time_sort(amostra, time_insertion_sort ,  insertion_sort)

x = range(1, length=25)

plot(x, [time_bubble_sort time_insertion_sort], label = ["bubble_sort" "insertion_sort"], lw=2)
