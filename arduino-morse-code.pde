
int ledPin = 13;                // LED connected to digital pin 13
int length = 300;               // Unit length in miliseconds

char* lookup[] = {
  ".-",
  "-...",
  "-.-.",
  "-..",
  ".",
  "..-.",
  "--.",
  "....",
  "..",
  ".---",
  ".-.-",
  ".-..",
  "--",
  "-.",
  "---",
  ".--.",
  "--.-",
  ".-.",
  "...",
  "-"   ,
  "..-" ,
  "...-",
  ".--" ,
  "-..-",
  "-.--",
  "--.."
};

void setup() {
  pinMode(ledPin, OUTPUT);      // sets the digital pin as output
}


void long_mark() {
  digitalWrite(ledPin, HIGH);
  delay(length*3);
  digitalWrite(ledPin, LOW);
}

void short_mark() {
  digitalWrite(ledPin, HIGH);
  delay(length);
  digitalWrite(ledPin, LOW);
}

void intra_char_gap() {
  delay(length);
}

void char_gap() {
  delay(length*3);
}

void word_gap() {
  delay(length);
}

void blink_char(char c) {
  if(c == '-')
    long_mark();
  else
    short_mark();
  intra_char_gap();
}

void blink(char str[]) {
  int c;
  int ic;
  for(c=0; c<strlen(str); c++) {
    if(str[c] == ' ')
      word_gap();
    else {
      int idx = (int)str[c] - 65;
      char* chr = lookup[idx];
      for(ic=0; ic<strlen(chr); ic++) {
        blink_char(chr[ic]);
      }
      char_gap();
    }
  }
}

void loop() {
  blink("SOS");
  delay(5000);
}
