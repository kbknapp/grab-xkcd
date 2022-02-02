use clap::{ArgEnum, Parser};

/// A utility to grab XKCD comics
#[derive(Parser)]
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
}

#[derive(ArgEnum, Copy, Clone)]
pub enum OutFormat {
    Json,
    Text,
}
