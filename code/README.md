### Building and Deploying to Github Pages

1. Build the site:
`flutter build web --web-renderer html --release`
2. Copy `/build/web/` into Github Pages repo
3. Fix folders: make `/assets/assets/images/` to `/assets/images/`
4. Local test with: `python3 -m http.server 8000`
5. Push to Github

### Updating Map

Update the data in `connected_map.dart` to update the map