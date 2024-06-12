const express = require('express');
const rotas = express();
const controladores = require('./controladores/controladores')


rotas.post('/autor', controladores.cadastrarAutor);
rotas.get('/autor/:id', controladores.buscarAutores);


module.exports = rotas;