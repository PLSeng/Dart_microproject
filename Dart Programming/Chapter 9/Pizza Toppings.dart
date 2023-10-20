void main() {
  Pizza pepperoni = Pizza(cheeze: true, pepperoni: true);
  
  pepperoni.printChoices();
}

class Pizza {
  /* write your code here */
  final bool? cheeze;
  final bool? pepperoni;
  final bool? pineapple;
  final bool? olive;
  final bool? tomato;
  final bool? mushroom;
  final bool? pepper;
  final bool? mint;
  final bool? onion;
  
Pizza({
    this.cheeze,
    this.pepperoni,
    this.pineapple,
    this.olive,
    this.tomato,
    this.mushroom,
    this.pepper,
    this.mint,
    this.onion,
});
  
  void printChoices() {
    print(
      'name: pepperoni,\n'
      'cheeze: ${cheeze ?? false},\n'
      'pepperoni: ${pepperoni ?? false},\n'
      'pineapple: ${pineapple ?? false},\n'
      'olive: ${olive ?? false},\n'
      'tomato: ${tomato ?? false},\n'
      'mushroom: ${mushroom ?? false},\n'
      'pepper: ${pepper ?? false},\n'
      'mint: ${mint ?? false},\n'
      'onion: ${onion ?? false},\n'
    );
  }
}



