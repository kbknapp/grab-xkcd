use clap::*;
use clap_generate::{generate_to, generators::*};

include!("src/cli.rs");

fn main() {
    let mut app = Args::into_app();
    app.set_bin_name("grab-xkcd");

    let outdir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("completions/");
    generate_to::<Bash, _, _>(&mut app, "grab-xkcd", &outdir);
    generate_to::<Fish, _, _>(&mut app, "grab-xkcd", &outdir);
    generate_to::<Zsh, _, _>(&mut app, "grab-xkcd", &outdir);
    generate_to::<PowerShell, _, _>(&mut app, "grab-xkcd", &outdir);
    generate_to::<Elvish, _, _>(&mut app, "grab-xkcd", &outdir);
}
