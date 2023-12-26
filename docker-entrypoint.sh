set -e

git clone https://github.com/hari6091/frontend-ingress-react.git /app

cd /app
npm install
npm run build

nginx -g 'daemon off;'
