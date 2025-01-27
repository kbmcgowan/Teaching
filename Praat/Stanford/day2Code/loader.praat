# loader.praat - load all of the (lowercase) .wav files
# from dir$ into the Objects list

dir$ = "stimuli/"
strings = Create Strings as file list: "list",
...dir$ + "/*.wav"

numberOfFiles = Get number of strings

for ifile to numberOfFiles
    selectObject: strings
    fileName$ = Get string: ifile
    Read from file: dir$ + "/" + fileName$
endfor

removeObject: strings