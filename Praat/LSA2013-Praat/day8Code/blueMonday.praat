# plays Blue Monday by New Order, sort of.
# 16 July 2013, Kevin B. McGowan <kbmcgowan@stanford.edu>

song$ = "349.23, 261.63, 293.66, 293.66, 392.00, 261.63, 293.66, 293.66"

for reps from 1 to 2
     @split( ",", song$ )

     for note from 1 to split.length
         @playPairs( number( split.array$[note] ))
     endfor
endfor

procedure playPairs( .note )
    # first generate one octave below our note
    .octaveID = do( "Create Sound as pure tone...", "note", 1, 0, 0.05,
            ...10000, .note / 2, 0.7, 0.01, 0.09 )

    .noteID = do ( "Create Sound as pure tone...", "note", 1, 0, 0.05,
            ...10000, .note, 0.7, 0.01, 0.09 )

    for i from 1 to 2
        # play each octave pair twice
        selectObject( .octaveID )
        do( "Play" )

        selectObject( .noteID )
        do( "Play" )
    endfor

    removeObject( .octaveID )
    removeObject( .noteID )
endproc

# split proc written by Jose J. Atria (28 February 2012)
procedure split( .sep$, .str$ )
    .length = 0
    repeat
        .strlen = length( .str$ )
        .sep = index( .str$, .sep$ )
        if .sep > 0
            .part$ = left$( .str$, .sep - 1 )
            .str$ = mid$( .str$, .sep + 1, .strlen )
        else
            .part$ = .str$
        endif

        .length = .length+1
        .array$[.length] = .part$
    until .sep = 0
endproc
