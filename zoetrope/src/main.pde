const int controlPin1 = 2;
const int controlPin2 = 3;
const int enablePin = 9;
const int directionSwitchPin = 4;
const int onOffSwitchStateSwitchPin = 5;
const int potPin = A0;

int onOffSwithcState = LOW;
int directionSwitchState = LOW;

bool motorEnabled = false;
bool motorDirection = false;
int motorSpeed = 0;

void setup()
{
    pinMode(directionSwitchPin, INPUT);
    pinMode(onOffSwitchStateSwitchPin, INPUT);
    pinMode(controlPin1, OUTPUT);
    pinMode(controlPin2, OUTPUT);
    pinMode(enablePin, OUTPUT);
    digitalWrite(enablePin, LOW);
}

void loop()
{
    // check on/off switch state
    // Here we need to store the previous state, otherwise the switch does not work. (1000 toggles
    // in 1 sec)
    int onOffSwitchStateNew = digitalRead(onOffSwitchStateSwitchPin);
    if (onOffSwitchStateNew != onOffSwithcState) {
        onOffSwithcState = onOffSwitchStateNew;
        if (onOffSwitchStateNew == HIGH) {
            motorEnabled = !motorEnabled;
        }
    }

    // check direction switch state
    int directionSwitchStateNew = digitalRead(directionSwitchPin);
    if (directionSwitchStateNew != directionSwitchState) {
        directionSwitchState = directionSwitchStateNew;
        if (directionSwitchStateNew == HIGH) {
            motorDirection = !motorDirection;
        }
    }

    if (motorDirection) {
        digitalWrite(controlPin1, HIGH);
        digitalWrite(controlPin2, LOW);
    } else {
        digitalWrite(controlPin1, LOW);
        digitalWrite(controlPin2, HIGH);
    }

    if (motorEnabled) {
        int motorSpeed = analogRead(potPin) / 4;
        analogWrite(enablePin, motorSpeed);
    } else {
        analogWrite(enablePin, 0);
    }
}
