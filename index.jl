maxRange = 256
sieveVec = Vector{UInt128}()



function main()
  calc::UInt128 = 2^128 - uint128"1"
  push!(sieveVec, calc)
  println(sieveVec)
  for x::UInt128 = 1:sqrt(maxRange)
    sieveOfEratosthenes(x, sieveVec, 0)
  end
end

function sieveOfEratosthenes(number::UInt128, sieve::Vector{UInt128}, position)
  println(bitstring(sieve[1]))
  rest::UInt128 = number % 128
  intDiv::UInt128 = floor(number / 128) + 1
  shift::UInt128 = (1 << rest)
  result = sieve[intDiv] & shift

  if number <= 1
    sieve[intDiv] = xor(sieve[intDiv], shift)
  elseif result > 1
    composite::UInt128 = number * 2
    while composite < length(sieve) * 128
      rest = composite % 128
      shift = (uint128"1" << rest)
      sieve[intDiv] = sieve[intDiv] & ~shift
      composite += number
    end
  end
end

main()

