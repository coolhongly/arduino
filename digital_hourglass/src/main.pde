const int switchPin = 8;
const long interval = 500;

int led = 2;

unsigned long time = 0;
int switchState = 0;

void setup()
{
    // pin setup
    for (int x = 2; x < 8; x++) {
        pinMode(x, OUTPUT);
    }
    pinMode(switchPin, INPUT);

    // variable initialization
    switchState = digitalRead(switchPin);
}

// reset leds to be all off
void resetLED()
{
    for (int x = 2; x < 8; x++) {
        digitalWrite(x, LOW);
    }
    led = 2;
}

void loop()
{
    int switchStateNew = digitalRead(switchPin);
    int timeNew = millis();

    // check if the switch changes orientation
    if (switchStateNew != switchState) {

        // If the orientation is changed, reset leds and variables.
        resetLED();
        switchState = switchStateNew;

        time = timeNew;
    } else {
        if (timeNew - time >= interval) {

            // check if overflow
            if (led == 8) {
                resetLED();
            } else {
                digitalWrite(led, HIGH);
                led++;
            }

            time = timeNew;
        }
    }
}
