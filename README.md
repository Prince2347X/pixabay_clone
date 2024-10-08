# pixabay_clone

A flutter project showing an image gallery in a staggered view. (Image source - Pixabay API)

## Features
 - Responsive Layout - Automatically adjust number of columns based on screen width
 - Shimmer Loading - Shows a beautiful shimmer loading animation
 - Cached images - The network images are cached so it doesn't load the same image repeatedly
 - Shows no. of likes and views

## Getting Started

### Prerequisites
 - Flutter installed on your machine.
 - A Pixabay API key. You can get one by signing up at Pixabay.

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/pixabay_clon.git
    cd pixabay_clone
    ```

2. Get the dependencies
    ```
    flutter pub get
    ```

3. Create a `.env` file in root directory and add Pixabay API Key

### Running the app
To run the app on your local machine, use the following command:
```bash
flutter run --dart-define=PIXABAY_API_KEY=your_api_key_here
```

### Building for web
To build the project for the web, use the following command:
```bash
flutter build web --release --dart-define=PIXABAY_API_KEY=your_api_key_here
```

## GitHub Pages Deployment

This project is set up to deploy the web build to GitHub Pages. The deployment is handled by a GitHub Actions workflow defined in [`.github/workflows/publish_gh_pages.yml`](.github/workflows/publish_gh_pages.yml).

### Steps to Deploy

1. Ensure you have the `PIXABAY_API_KEY` and `GITHUB_TOKEN` secrets set up in your GitHub repository settings.
2. Push your changes to the `master` branch.
3. The GitHub Actions workflow will automatically build and deploy the web version of the app to GitHub Pages.

### Demo

You can view the live demo of the project [here](https://yourusername.github.io/pixabay_clone/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.