// Soll die Summme aller Zahlen von a bis einschließlich b zurückgeben

public int summe (int a, int b){
  // TODO: implementiere diese Methode richtig
  int sum = 0;
  for(int i = a; i <= b; i++){
    sum = sum + i;
  }
  return sum;
}
