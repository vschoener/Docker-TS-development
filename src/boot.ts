import express from 'express';
import http from 'http2';

const app = express();

app.get('/', () => { message: 'Hellow Docker and TypeScript' });


http.createServer(app).listen('8080', () => {
  console.log('Ready fox! I\'m listening')
});