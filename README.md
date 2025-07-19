
# YouTube Without YouTube (yt-play)

**yt-play** is a simple command-line YouTube player that allows you to search for and play YouTube videos without directly using the YouTube website. This project utilizes a Bash script to fetch video links and play them using `mpv`.

## Features

- Search for YouTube videos using a query.
- Display a list of video links.
- Play the selected video in `mpv` with a maximum resolution of 480p but can be changed whenever wanted.

## Requirements

Before you begin, ensure you have the following installed on your system:

- **Bash**: A Unix shell and command language.
- **curl**: A command-line tool for transferring data with URLs.
- **grep**: A command-line utility for searching plain-text data.
- **sed**: A stream editor for filtering and transforming text.
- **nl**: A command-line utility for numbering lines of files.
- **rofi**: A window switcher, application launcher, and dmenu replacement.
- **mpv**: A media player that supports a wide variety of video formats.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yatharthgeek/yt-play.git
   cd yt-play
   ```

2. **Make the script executable**:

   ```bash
   chmod +x yt-play.sh
   ```

3. **Run the script**:

   You can run the script by providing a search query as an argument:

   ```bash
   ./yt-play.sh "<search_query>"
   ```

   Replace `<search_query>` with your desired search term.

## How It Works

1. The script checks if a search query is provided. If not, it displays usage instructions.
2. It encodes the search query for use in a URL.
3. It fetches links from the search results and saves them to `links.txt`.
4. It displays the list of video titles using `rofi` for selection.
5. After selecting a video, it retrieves the corresponding link and plays it using `mpv`.

## Example Usage

To search for "funny cat videos", run:

```bash
./yt-play.sh "funny cat videos"
```


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
