def fact(n)
  n == 0 ? 1 : n * fact(n -1)
end
p fact(5)
