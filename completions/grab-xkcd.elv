
edit:completion:arg-completer[grab-xkcd] = [@words]{
    fn spaces [n]{
        repeat $n ' ' | joins ''
    }
    fn cand [text desc]{
        edit:complex-candidate $text &display-suffix=' '(spaces (- 14 (wcswidth $text)))$desc
    }
    command = 'grab-xkcd'
    for word $words[1:-1] {
        if (has-prefix $word '-') {
            break
        }
        command = $command';'$word
    }
    completions = [
        &'grab-xkcd'= {
            cand -t 'Set a connection timeout'
            cand --timeout 'Set a connection timeout'
            cand -o 'Print output in format FMT'
            cand --output 'Print output in format FMT'
            cand -n 'The comic to load'
            cand --num 'The comic to load'
            cand -s 'Save image file to current directory'
            cand --save 'Save image file to current directory'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
    ]
    $completions[$command]
}
