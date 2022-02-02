mod cli;
mod client;

use anyhow::Result;
use clap::Parser;

// Base URL of xkcd
const BASE_URL: &str = "https://xkcd.com";

fn main() -> Result<()> {
    let args = cli::Args::parse();
    let client = client::XkcdClient::new(args);
    client.run()
}
