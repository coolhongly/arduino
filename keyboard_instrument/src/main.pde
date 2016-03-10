int notes[] = {262, 294, 330, 349};

void setup() {
    Serial.begin(9600);
}

void loop() {
    int keyVal = analogRead(A0);
    Serial.println(keyVal);

    if (keyVal == 0) {
        tone(8, notes[0]);
    } else if (keyVal >= 15 && keyVal <= 25) {
        tone(8, notes[1]);
    } else if (keyVal >= 500 && keyVal <= 520) {
        tone(8, notes[2]);
    } else if (keyVal >= 1010 && keyVal <= 1020) {
        tone(8, notes[3]);
    } else {
        noTone(8);
    }
}
