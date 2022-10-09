function main()
  maxRange = 10000000
  sieveVec = Vector{UInt128}()
  calc::UInt128 = 2^128 - uint128"1"
  for _ = 1:floor(maxRange / 128)+1
    push!(sieveVec, calc)
  end
  for x::UInt128 = 1:sqrt(maxRange)
    sieveOfEratosthenes(x, sieveVec)
  end
end

function sieveOfEratosthenes(number::UInt128, sieve::Vector{UInt128})
  rest::UInt128 = number % 128
  intDiv::UInt128 = floor(number / 128) + 1
  shift::UInt128 = (uint128"1" << rest)
  result = sieve[intDiv] & shift

  if number <= 1
    sieve[intDiv] = xor(sieve[intDiv], shift)
  elseif result > 1
    composite::UInt128 = number * 2
    while composite < length(sieve) * 128
      intDiv = floor(composite / 128) + 1
      rest = composite % 128
      shift = (uint128"1" << rest)
      sieve[intDiv] = sieve[intDiv] & ~shift
      composite += number
    end
  end
end


@time main()