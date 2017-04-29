Builds a container that is able to upload some mp3 tracks to your google music account

* How to use ?
The bin directory contains two scripts:
** init-gmusic.sh : init.sh uid credentials_folder
The init step that is required to create the authorization token.
The authorization token is stored in the docker volume provided when the script is started.
The uid parameter is a unique id given as a MAC address (e.g. '00:11:22:33:AA:BB').
** start-gmusic.sh : start_gmusic.sh uid credentials_folder music_folder
This script starts the container with the crendentials folder containing the stored authorization token
and the music to scan for music to be updloaded.
The uid parameter is a unique id given as a MAC address (e.g. '00:11:22:33:AA:BB').
Once uploaded to Google service the track is deleted from the backing store.
