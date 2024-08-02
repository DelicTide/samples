This repo servers a my sample rack for live coding. 
    Feel free to use and distribute the samples:)

The idea behind the libarary is to use orginal /organic audio for algo-rythmic synthesization. Creating an ensamble from organic sampling. I.e. a single 10 or 30 second recorded audio clip could be cut, looped and layered with effects to create all aspects of an edm track, bass line, melody, chourus etc. by algorythmically slicing and looping the audio at differnet points in the sample. 

    The coolest part is you can do all this right in the browser! No need to download or install anything! 
        Try it out at strudle.repl 
        load your samples for retreival into a git repo
        and call your samples in the browser 

Strudel asks for .wav files and most programs don't like spaces in the file names, so I created some script to help out with those and added a query to limit file sizes to 150mb. 

oversized_files.py : will look for files over 150mb and if found move them to a subfolder.

convert2wav.sh : uses ffmpeg to convert .mp3/m4a to .wav. 

rename_files.sh : will fill in any file name gaps with an underscore. 

To run these open a terminal in the root ./dir and run
chmod +x run.sh
chmod +x tools/rename_files.sh
chmod +x tools/convert2wav.sh

./run.sh
    or you can run them individually like so
    ./run.sh -o
    ./run.sh -c
    ./run.sh -r
    ./run.sh -g

    This is a neat tool for a libarary that is constantly being added to from a modile device. Each time you add new content simply run.sh to organize your file.