# hw2-loops.praat : read TextGrid file and report some attributes

tGrid = do ( "Read from file...", "tobi/tobi.TextGrid" )
totalDuration = do ("Get total duration")
writeInfoLine( "Total duration: ", fixed$(totalDuration, 2), " seconds" )

numberOfTiers = do ( "Get number of tiers" )
appendInfoLine( "Number of tiers is: ", numberOfTiers )

for tier from 1 to numberOfTiers
    name$ = do$( "Get tier name...", tier )
    appendInfoLine( tab$, "Tier ", tier, ": """, name$, """" )

    if do ( "Is interval tier...", tier )
        intervals = do ( "Get number of intervals...", tier )
        appendInfoLine( tab$, tab$, "there are ", intervals, " intervals." )
    else
        points = do ( "Get number of points...", tier )
        appendInfoLine( tab$, tab$, "there are ", points, " points.")
        for pt from 1 to points
            label$ = do$("Get label of point...", tier, pt)
            time = do ("Get time of point...", tier, pt)
            appendInfoLine(tab$, tab$, tab$, "Pt ", pt, ":", tab$, tab$, tab$, fixed$(time,3), tab$, label$)
        endfor
    endif
    if name$ = "words"
        for int from 1 to intervals
            label$ = do$("Get label of interval...", tier, int)
            if label$ <> ""
                labelstart = do ("Get start point...", tier, int)
                labelend = do ("Get end point...", tier, int)
                appendInfoLine(tab$, tab$, tab$, "Int ", int, ":", tab$, tab$, fixed$(labelstart,3), tab$, fixed$(labelend,3), tab$, label$)
                justlabel = do ("Extract part...", labelstart, labelend, "rectangular", 1.0, "yes") ; HERE IS THE PROBLEM
                do ("Save as WAV file...", "tobi/" + label$ + ".wav")
            endif
        endfor
    endif
endfor

removeObject( tGrid )