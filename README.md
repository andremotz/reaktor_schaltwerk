reaktor_schaltwerk
==================

reaktor - brewing beer with Raspberry Pi and Arduino.

reaktor_schaltwerk is an Arduino-patch running currently on an Arduino Uno micro-controler. Connected to the Arduino, two PT1000 temperature-sensors are used to monitor the current mash-temperature. A hacked Intertechno-remote control sends on/off commands to two plug sockets to switch two circuits of a heating element. Its main loop is designed to fetch values of two connected PT1000-temperature sensors and displays them via serial-console. Feebdack is been processed from reaktor_zentrale.
