use clap::{Clap, IntoApp};
use clap_generate::{generate, generators::*};

/// A utility to grab XKCD comics
#[derive(Clap)]
pub struct Args {
    /// Set a connection timeout
    #[clap(long, short, default_value = "30")]
    pub timeout: u64,
    /// Print output in format FMT
    #[clap(long, short, arg_enum, default_value = "text")]
    pub output: OutFormat,
    /// The comic to load
    #[clap(long, short)]
    pub num: Option<usize>,
    /// Save image file to current directory
    #[clap(long, short)]
    pub save: bool,
    /// Generate a SHELL completion script and print to stdout
    #[clap(long, short, arg_enum, value_name = "SHELL")]
    pub completions: Option<Shell>,
}

#[derive(Clap, Copy, Clone)]
pub enum Shell {
    Bash,
    Zsh,
    Fish,
    PowerShell,
    Elvish,
}

impl Shell {
    pub fn generate(&self) {
        let mut app = Args::into_app();
        let mut fd = std::io::stdout();
        match self {
            Shell::Bash => generate::<Bash, _>(&mut app, "grab-xkcd", &mut fd),
            Shell::Zsh => generate::<Zsh, _>(&mut app, "grab-xkcd", &mut fd),
            Shell::Fish => generate::<Fish, _>(&mut app, "grab-xkcd", &mut fd),
            Shell::PowerShell => generate::<PowerShell, _>(&mut app, "grab-xkcd", &mut fd),
            Shell::Elvish => generate::<Elvish, _>(&mut app, "grab-xkcd", &mut fd),
        }
    }
}

#[derive(Clap, Copy, Clone)]
pub enum OutFormat {
    Json,
    Text,
}
