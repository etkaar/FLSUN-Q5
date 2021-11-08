# LED Plate Holder for FLSUN Q5
Attachable illumination plate for FLSUN Q5 printer which can hold three LEDs.

🎞 You can find a short video [here](https://www.youtube.com/watch?v=atVG6flC78Q).

# Important

- Make sure, that you have both wires (+ and -) together on the left or right side (see my example with an isolated black wire). Otherwise you cannot install the plate without unplugging all other wires.
- In my example, I *omitted* the top plate which prevents the LEDs backlight from dazzling into your eyes.
- The dimensions are for the **default** setup. For my Noctua one I needed to increase [*LENGTH*](https://github.com/etkaar/FLSUN-Q5/blob/main/IlluminationPlateHolder.scad) from 46 to 47 mm.

# Notes

- The power supply of the FLSUN Q5 has an unused 24V terminal. You can use that.
- You can use JST connectors to allow simple (un)plugging of the illumination plate.
- An LED always needs a resistor to limit the current: Seperate resistors for each LED in parallel *or* one resistor if multiple LEDs are wired in series. For this holder we only need one resistor, because the three LEDs are wired in series. Altough resistors might be sometimes referred to as 'pre-resistor', a resistor can be placed before, after or even between. That makes absolutely no difference.

# Photos

![DSC_0038](https://user-images.githubusercontent.com/40885610/140659852-a3462518-6257-44e9-84bd-b964f686d143.JPG)
![DSC_0154](https://user-images.githubusercontent.com/40885610/140663714-e008f1c1-6175-45a5-a810-bc276f6c6f32.JPG)

![Top](https://user-images.githubusercontent.com/40885610/140739960-c1edeab4-36f8-4de2-af87-4cf54f019060.jpg)
![Bottom](https://user-images.githubusercontent.com/40885610/140739973-f338ff60-7c9d-43ff-92dc-9ecf165c98bc.jpg)


# Preview (OpenSCAD)
<img width="943" alt="FLSUN-Q5-LED-Holder" src="https://user-images.githubusercontent.com/40885610/140659686-2dd251aa-b955-466c-b95a-f8d57c238b5c.png">
<img width="943" alt="FLSUN-Q5-LED-HolderBase" src="https://user-images.githubusercontent.com/40885610/140659771-1731724f-69fd-474d-be0c-ca30f6a98df9.png">
