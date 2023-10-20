void main() {
  
	// Choices: Lightsaber, Magic Wand, Sword or None
  var weapon = "Magic Wand";/* write your code here */
  
  print("There is a dragon attacking the village! Let's fight it!");
	print('Your weapon is $weapon.');

  String result = "Default";

  /* write your code here */
  switch (weapon){
    case 'Lightsaber':
      result = '';
      break;
    case 'Magic Wand' :
      result = 'The magic spell worked! You killed the dragon and became a hero! :)';
      break;
    case 'Sword':
      result = "";
      break;
    default: 
      result = '';
      break;
  }

  print(result);
}



