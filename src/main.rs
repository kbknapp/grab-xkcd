mod cli;
mod client;

use anyhow::Result;
use clap::Clap;

// Base URL of xkcd
const BASE_URL: &str = "https://xkcd.com";

fn main() -> Result<()> {
    let args = cli::Args::parse();

    if let Some(shell) = args.completions {
        shell.generate();
        std::process::exit(0);
    }

    let client = client::XkcdClient::new(args);
    client.run()
}
