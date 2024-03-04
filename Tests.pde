import java.util.function.Function;

private final int[] MAXIMALE_PUNKTZAHL = new int[]{6,6,3,4};
private int[] erreichte_punktzahl = new int[4];

private class Paar{
  public int a, b;
  public Paar(int a, int b){ this.a = a; this.b = b; }
  public String toString() { return a + ", " + b; }
}

void testsAusfuehren() {
  int ergebnis;
  
  Function<Paar, Integer> testeSumme = paar -> summe(paar.a, paar.b);
  
  // Teste Aufgabe 1 (summe)
  erreichte_punktzahl [0] += testeAufgabe(testeSumme, "summe", new Paar(0,0), 0);
  erreichte_punktzahl [0] += testeAufgabe(testeSumme, "summe", new Paar(42,42), 42);
  erreichte_punktzahl [0] += testeAufgabe(testeSumme, "summe", new Paar(0,10), 55);
  erreichte_punktzahl [0] += testeAufgabe(testeSumme, "summe", new Paar(0,100), 5050);
  erreichte_punktzahl [0] += testeAufgabe(testeSumme, "summe", new Paar(6,10), 40);
  erreichte_punktzahl [0] += testeAufgabe(testeSumme, "summe", new Paar(-11,10), -11);
  
  // Teste Aufgabe 2 (dezimalStellen)
  erreichte_punktzahl [1] += testeAufgabe(this::dezimalStellen, "dezimalStellen", 0, 0);
  erreichte_punktzahl [1] += testeAufgabe(this::dezimalStellen, "dezimalStellen", 9, 1);
  erreichte_punktzahl [1] += testeAufgabe(this::dezimalStellen, "dezimalStellen", -1, 1);
  erreichte_punktzahl [1] += testeAufgabe(this::dezimalStellen, "dezimalStellen", 10, 2);
  erreichte_punktzahl [1] += testeAufgabe(this::dezimalStellen, "dezimalStellen", 999, 3);
  erreichte_punktzahl [1] += testeAufgabe(this::dezimalStellen, "dezimalStellen", 123456, 6);
  
  // Teste Aufgabe 3
  erreichte_punktzahl [2] += testeAufgabe(this::letztesElement, "letztesElement", new int[]{0}, 0);
  erreichte_punktzahl [2] += testeAufgabe(this::letztesElement, "letztesElement", new int[]{42}, 42);
  erreichte_punktzahl [2] += testeAufgabe(this::letztesElement, "letztesElement", new int[]{1,2,3,4,5}, 5);
  
  // Teste Aufgabe 4
  erreichte_punktzahl [3] += testeAufgabe(this::testeRichtungAnsagen, "richtungAnsagen", LEFT, "links");
  erreichte_punktzahl [3] += testeAufgabe(this::testeRichtungAnsagen, "richtungAnsagen", RIGHT, "rechts");
  erreichte_punktzahl [3] += testeAufgabe(this::testeRichtungAnsagen, "richtungAnsagen", UP, "oben");
  erreichte_punktzahl [3] += testeAufgabe(this::testeRichtungAnsagen, "richtungAnsagen", DOWN, "unten");
  
}

String testeRichtungAnsagen(int richtung){
  ausgabe = "";
  richtungAnsagen(richtung);
  return ausgabe.trim().toLowerCase();
}

<T,R> int testeAufgabe(Function<T,R> funktion, String name, T parameter, R erwartet){
  PApplet.print(name + "(" + parameter + ")");
  
  R ergebnis;
  try{
    ergebnis = funktion.apply(parameter);
  } catch (Exception e){
    PApplet.print("wirft einen Fehler: " + e );
    return 0;
  }
  
  PApplet.print("ergibt" + ergebnis + " - " );
  
  if (erwartet.equals(ergebnis)){ 
    PApplet.println("richtig");
    return 1;
  }
  else{ 
    PApplet.println("falsch");
    return 0;
  }
}

void testsZeichnen () {
  for (int nr = 0; nr < 4; nr ++){
    float prozent = erreichte_punktzahl[nr] / (float) MAXIMALE_PUNKTZAHL[nr];
    stroke(#C1C1C1);
    strokeWeight(5);
    noFill();
    ellipse(height * (nr + 0.5), height / 2, height * 0.4, height * 0.4); 
    if (erreichte_punktzahl[nr]  == MAXIMALE_PUNKTZAHL[nr]) stroke(#20C918);
    else if (prozent >= 0.5) stroke (#F5C62C);
    else stroke(#F53C28);
    arc(height * (nr + 0.5), height / 2, height * 0.4, height * 0.4, - PI / 2, - PI / 2 + 2 * PI * prozent );
    
  }
}


static String ausgabe;

public static void println(String s){
  ausgabe += s + "\n";
}
