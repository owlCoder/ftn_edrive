int foo(int p, unsigned b, unsigned c)
{
  return p;
}

int fa() 
{
  return 5;
}

int f3(int a, int b, int c, int d)
{
  return 4;
}

int main() 
{
  int a;

  a = foo(2, 3u, a+b);
  a = fa();
  a = f3(1, 2, 3, 4);

  return 0;
}
