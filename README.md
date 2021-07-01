
# unsilence-helper
A windows installer for everything you'll need for <a href="https://github.com/lagmoellertim/unsilence"> Unsilence</a> and a helper wrapper script to help you run it. This was half a scripting exercise and half a tool for some friends who wanted to use this, but don't into computer.
<br />
<br />
To install, just run <a href="https://github.com/edeloya/unsilence-helper/releases/latest/download/Installer.bat">_Install.bat_</a> once as Admin. Then place <a href="https://github.com/edeloya/unsilence-helper/releases/latest/download/Unsilence-Helper.bat">_Unsilence-Helper.bat_</a> in the same folder as the file you're aiming it at, double-click to run it, and follow the on-screen instrunctions to cut down videos/lectures that drag on unnecessarily! :)
<br />
<br />
<br />
Sample Videos (click to open gif preview on YT):
<br />
<br />

|Original|After|
|---|---|
|[![Original][Original_gif]][Original_vid]|[![New][new_gif]][new_vid]|

<p align="center">
  <p align="center">
  <img src="https://user-images.githubusercontent.com/54195989/117718727-129c8d00-b1a2-11eb-9a76-384d8b020f21.png">
</p>

[Original_gif]: https://user-images.githubusercontent.com/54195989/117728468-213d7100-b1af-11eb-83c4-bd0c10e72843.gif
[Original_vid]: https://youtu.be/Qv6s877vG1s

[new_gif]: https://user-images.githubusercontent.com/54195989/117728500-2a2e4280-b1af-11eb-868c-4a01935e73f7.gif
[new_vid]: https://youtu.be/_zW2hLidZM4

<br />
<br />

Installation Demo:

https://user-images.githubusercontent.com/54195989/117186281-493c6700-ada0-11eb-9e2b-364bcba13d66.mp4

Use Demo:

https://user-images.githubusercontent.com/54195989/117186285-493c6700-ada0-11eb-88c0-43046fdf2810.mp4

*Note: You can also type in the filename, I was just lazy and drag n' dropped (which also works!)<br />
**Note: ![Links](https://user-images.githubusercontent.com/54195989/117737888-6ae28780-b1c0-11eb-8db8-95c0e22e7c03.mp4) also work! Youtube and anything else ![youtube-dl](https://github.com/ytdl-org/youtube-dl) supports.


<br />
CLI Usage:<br />
Just feed arguments following the format: <br />
Unsilence-Helper.bat &lttarget&gt &ltaudible speed&gt &ltsilent speed&gt &ltaudible vol&gt &ltsilent vol&gt <br />
Make sure you encase links and any filenames with spaces in quotes. Settings left blank will fill in with the defaults. <br /><br />

Examples:<br />
_Unsilence-Helper.bat example.mp4 1.1 12 1 .2_ <br />
_Unsilence-Helper.bat "example 2 - the spacening.mp4" 1.1 12 1 .2_ <br />
_Unsilence-Helper.bat "https://youtu.be/dQw4w9WgXcQ" 1 5_
