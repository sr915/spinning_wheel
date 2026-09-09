<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This module uses a shift register to illuminate one part of seven segment display at a time. The illuminated segment rotates around the display like a spinning wheel. 

A counter will increment a set value until it reaches the threshold, upon which it will shift the register. The incremented amount is set by ui_in. When ui_in = 0x1, the register should shift every 1s (given clock speed of 10MHz). When ui_in =0xF, the register should shift every 1/15s. 

## How to test

Connect 8 input switches to ui_in. The binary value of ui_in will set the speed of rotation.

## External hardware
- 7-Segment Display
- Input switches (x8)
