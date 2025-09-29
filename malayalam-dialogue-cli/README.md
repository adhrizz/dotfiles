# Malayalam Dialogue CLI

A fun command-line tool for the Linux terminal that displays random, classic dialogues from Malayalam cinema.

## Features

- Get a random dialogue from a large collection.
- Get a random dialogue from a specific actor.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/malayalam-dialogue-cli.git](https://github.com/YOUR_USERNAME/malayalam-dialogue-cli.git)
    cd malayalam-dialogue-cli
    ```

2.  **Make the script executable:**
    ```bash
    chmod +x maladialogue
    ```

3.  **Move the script to your local bin directory to make it a global command:**
    ```bash
    sudo mv maladialogue /usr/local/bin/
    ```

4.  **Move the dialogue files to your home directory:**
    ```bash
    mv *.txt ~/
    ```

## Usage

Once installed, you can call the script from anywhere in your terminal.

#### Get a Random Dialogue
```bash
maladialogue

# Examples
maladialogue mohanlal
maladialogue mammootty
maladialogue sureshgopi
