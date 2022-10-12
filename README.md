# Sieve Of Eratosthenes - Server

## Requirements

- Docker-compose v2.1
- Docker v20

## Instalation

Inside the directory of the project, run

```bash
docker-compose up
```

And that is it! The server will be runnig at [localhost:8000](http://localhost:8000)

## About the project

This is a simple julia project. It exposes a api to calculate prime numbers up to a range.

### The api

Once the server is running, any GET request on `/number/{number}`, where {number} is the range's limit starting from 2.

#### Example

To calculate all primes from 2 to 25

```bash
curl "http://localhost:8000/number/25"
```

The response will be an array with primes

```json
[2, 3, 5, 7, 11, 13, 17, 19, 23]
```

### The Algorithm

All prime numbers are calculated with the Sieve Of Eratosthenes algorithm, wich consists in find all composite numbers within a range

#### Brief description

1. Write all numbers from 2 to N.
2. Take the first number and find its multiples, they're composities by definition (has 2 distinct divisors)
3. Take the first number that hasn't been marked as composite, consider it's prime
4. From that prime number, run through all its multiples up to N and mark them as composites
5. Repeat from step 3.
