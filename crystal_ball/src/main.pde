#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,5,4,3,2);
String replys[] = {"Yes","Most likely","Certainly","Outlook good","Unsure","Ask again","Doubtful",
                   "No"};

int const switchPin = 6;
int switchState = 0;

void setup()
{
    lcd.begin(16, 2);
    pinMode(switchPin, INPUT);
    lcd.print("Ask the");
    lcd.setCursor(0, 1);
    lcd.print("Crystall Ball!");
}

void loop()
{
    int switchStateNew = digitalRead(switchPin);
    if (switchStateNew != switchState) {
        switchState = switchStateNew;
        if (switchStateNew == LOW) {
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("The ball says:");
            lcd.setCursor(0,1);
            lcd.print(replys[random(8)]);
        }
    }
}
