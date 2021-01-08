
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'grab-xkcd' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'grab-xkcd'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'grab-xkcd' {
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Set a connection timeout')
            [CompletionResult]::new('--timeout', 'timeout', [CompletionResultType]::ParameterName, 'Set a connection timeout')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Print output in format FMT')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Print output in format FMT')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'The comic to load')
            [CompletionResult]::new('--num', 'num', [CompletionResultType]::ParameterName, 'The comic to load')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Save image file to current directory')
            [CompletionResult]::new('--save', 'save', [CompletionResultType]::ParameterName, 'Save image file to current directory')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
