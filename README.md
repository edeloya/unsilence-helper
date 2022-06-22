
## Prerequisites


<br>We will install/use [Choco](https://chocolatey.org/install#individual), to automate installing the prerequisites:
- [Windows Terminal](https://github.com/microsoft/terminal/releases/latest)
- [Python3](https://www.python.org/downloads/)
- [FFMPEG](https://ffmpeg.org/download.html)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [Unsilence](https://github.com/lagmoellertim/unsilence)

<br>Run Powershell as Administrator, paste the following, and hit enter (this may take a few minutes):
<br><pre><code>$archiveUrl = 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx';$archiveName = Split-Path -Leaf $archiveUrl;$archivePath = "$env:TEMP\$archiveName";(New-Object System.Net.WebClient).DownloadFile($archiveUrl, $archivePath);Add-AppxPackage $archivePath;Remove-Item $archivePath;Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex; choco install -y ffmpeg python yt-dlp microsoft-windows-terminal;function refresh-path { $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") }; refresh-path; pip install unsilence;cmd /C "ftype batfile=%localappdata%\Microsoft\WindowsApps\wt.exe -p `"Command Prompt`" `%1 `%*";echo " ";echo "All done! Closing"; PAUSE; EXIT
</code></pre><br>

## Usage
<br>To use, place <a href="https://github.com/edeloya/unsilence-helper/releases/latest/download/Unsilence-Helper.bat"><i>Unsilence-Helper.bat</i></a> in the same folder as the video you're using, double-click the .bat to run it, and follow the on-screen instrunctions! :)
<br>
<br>
<br>
Sample Videos (click to open gif preview on YT):
<br>
<br>

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

<br>
<br>

Installation Demo:


Use Demo:




**Note: ![Links](https://user-images.githubusercontent.com/54195989/117737888-6ae28780-b1c0-11eb-8db8-95c0e22e7c03.mp4) also work! Youtube and anything else ![yt-dlp](https://github.com/yt-dlp/yt-dlp) supports.
