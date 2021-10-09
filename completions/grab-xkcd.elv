
use builtin;
use str;

edit:completion:arg-completer[grab-xkcd] = [@words]{
    fn spaces [n]{
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand [text desc]{
        edit:complex-candidate $text &display-suffix=' '(spaces (- 14 (wcswidth $text)))$desc
    }
    command = 'grab-xkcd'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
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
            cand -h 'Print help information'
            cand --help 'Print help information'
            cand -V 'Print version information'
            cand --version 'Print version information'
            cand -s 'Save image file to current directory'
            cand --save 'Save image file to current directory'
        }
    ]
    $completions[$command]
}
