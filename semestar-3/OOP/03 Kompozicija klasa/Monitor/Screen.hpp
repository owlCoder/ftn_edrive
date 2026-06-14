#ifndef SCREEN_HPP
#define SCREEN_HPP

#include <iostream>
using namespace std;

#define KORAK 2

enum ScreenStates { ssON, ssOFF};

class Screen {
    private:
        ScreenStates state;
        int brightness;
    public:
        Screen() {
            state = ssOFF;
            brightness = 0;
        }
        bool incB() {
            if(state == ssON && brightness + KORAK <= 20) {
                brightness += KORAK;
                return true;
            }
            return false;
        }
        bool decB() {
            if(state == ssOFF && brightness - KORAK  >= 0) {
                brightness -= KORAK;
                return true;
            }
            return false;
        }
        void setState(const ScreenStates state) {
            this -> state = state;
        }
        ScreenStates getState() const {
            return state;
        }
        int getBrightness() const {
            return brightness;
        }
};

#endif // SCREEN_HPP
