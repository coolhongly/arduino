const int switchPin = 2;
const int motorPin = 9;

void setup()
{
    pinMode(switchPin, INPUT);
    pinMode(motorPin, OUTPUT);
    Serial.begin(9600);
}

void loop()
{
    int switchState = digitalRead(switchPin);
    digitalWrite(motorPin, switchState);

    Serial.println(switchState);
}
