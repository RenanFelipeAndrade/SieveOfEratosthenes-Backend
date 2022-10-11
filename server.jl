include("./index.jl")
using .SieveOfEratosthenes
using Genie, Genie.Requests, Genie.Responses
using JSON

route("/number/:number") do
  maxRange::UInt128 = parse(UInt128, payload(:number))
  sieve = init(maxRange)
  primes = Vector{UInt128}()
  rawPrimes = Vector{UInt128}()
  for i = eachindex(sieve), j = eachindex(bitstring(sieve[i]))
    number::UInt128 = (129 * (i - 1)) + j
    if parse(UInt128, reverse(bitstring(sieve[i]))[j]) == uint128"1"
      push!(rawPrimes, number)
    end
  end

  for n in rawPrimes
    if n <= maxRange
      push!(primes, n)
    end
  end
  return JSON.json(primes)
end

Genie.Server.up(8080, "0.0.0.0", async=false)
