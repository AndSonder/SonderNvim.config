const fs = require('fs');
const http = require('http');
const path = require('path');

const rootDirectory = __dirname;
const buildDirectory = path.join(rootDirectory, 'build');
const sourceStateFile = path.join(rootDirectory, 'preview.source');
const port = Number(process.env.PORT ?? 39127);
const contentTypes = {'.css': 'text/css; charset=utf-8', '.html': 'text/html; charset=utf-8',
  '.ico': 'image/x-icon', '.js': 'text/javascript; charset=utf-8', '.json': 'application/json; charset=utf-8',
  '.png': 'image/png', '.svg': 'image/svg+xml', '.webp': 'image/webp'};

function currentSource() {
  const sourcePath = fs.readFileSync(sourceStateFile, 'utf8').trim();
  const stats = fs.statSync(sourcePath);
  if (!stats.isFile()) throw new Error(`Markdown source is not a file: ${sourcePath}`);
  return {sourcePath, stats};
}

function send(response, status, body, contentType = 'text/plain; charset=utf-8') {
  response.writeHead(status, {'Cache-Control': 'no-store', 'Content-Type': contentType});
  response.end(body);
}

function safePath(baseDirectory, relativePath) {
  const resolvedPath = path.resolve(baseDirectory, relativePath);
  if (resolvedPath !== baseDirectory && !resolvedPath.startsWith(`${baseDirectory}${path.sep}`)) {
    throw new Error('Path escapes its allowed directory');
  }
  return resolvedPath;
}

function serveFile(response, filePath, cache = false) {
  const contentType = contentTypes[path.extname(filePath).toLowerCase()] ?? 'application/octet-stream';
  response.writeHead(200, {'Cache-Control': cache ? 'public, max-age=31536000, immutable' : 'no-cache',
    'Content-Type': contentType});
  fs.createReadStream(filePath).pipe(response);
}

http.createServer((request, response) => {
  try {
    const requestUrl = new URL(request.url, `http://${request.headers.host ?? 'localhost'}`);
    if (requestUrl.pathname === '/api/document') {
      const {sourcePath, stats} = currentSource();
      send(response, 200, JSON.stringify({sourcePath, name: path.basename(sourcePath, path.extname(sourcePath)),
        markdown: fs.readFileSync(sourcePath, 'utf8'), mtimeMs: stats.mtimeMs}), 'application/json; charset=utf-8');
      return;
    }
    if (requestUrl.pathname === '/api/asset') {
      const {sourcePath} = currentSource();
      const assetPath = safePath(path.dirname(sourcePath), requestUrl.searchParams.get('path') ?? '');
      if (!fs.statSync(assetPath).isFile()) throw new Error('Asset is not a file');
      serveFile(response, assetPath);
      return;
    }
    const requestedPath = requestUrl.pathname === '/' ? 'index.html' : requestUrl.pathname.slice(1);
    let filePath = safePath(buildDirectory, requestedPath);
    if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) filePath = path.join(buildDirectory, 'index.html');
    serveFile(response, filePath, requestUrl.pathname.startsWith('/assets/'));
  } catch (error) {
    send(response, 404, error.message);
  }
}).listen(port, '127.0.0.1', () => {
  process.stdout.write(`Docusaurus Preview listening on http://localhost:${port}\n`);
});
