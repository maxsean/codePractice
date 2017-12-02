//O(n^2)
var fib = function(num) {
  if (num <= 1) {
    return 1;
  }

  return fib(num - 1) + fib(num - 2)
}

//O(n)
var fibonacci = function(num) {
  var a = 1, b = 0, temp;
  while (num >= 0) {
    temp = a;
    a = a + b;
    b = temp;
    num--;
  }
  return b
}

//0(n) for space, 2N for time
var fibo = function(num, mem) {
  mem = mem || {};

  if (mem[num]) return mem[num];
  if (num <= 1) return 1;

  return mem[num] = fibo(num - 1, mem) + fibo(num - 2, mem)
}

console.log(fib(6))
console.log(fibonacci(6))
console.log(fibo(6))
