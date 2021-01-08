_grab-xkcd() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            grab-xkcd)
                cmd="grab__xkcd"
                ;;
            
            *)
                ;;
        esac
    done

    case "${cmd}" in
        grab__xkcd)
            opts=" -t -o -n -s -h -V  --timeout --output --num --save --help --version  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output)
                    COMPREPLY=($(compgen -W "json text" -- "${cur}"))
                    return 0
                    ;;
                    -o)
                    COMPREPLY=($(compgen -W "json text" -- "${cur}"))
                    return 0
                    ;;
                --num)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        
    esac
}

complete -F _grab-xkcd -o bashdefault -o default grab-xkcd
