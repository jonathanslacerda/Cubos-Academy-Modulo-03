const pool = require('../conexao');

const cadastrarAutor = async (req, res) => {
    const { nome, idade } = req.body;

    if (!nome) {
        return res.json({ mensagem: 'Campo nome é obrigatório' })
    }

    try {
        const queryCadastroAutores = 'INSERT INTO autores (nome, idade) VALUES ($1, $2)';

        const params = [nome, idade];

        const resultado = await pool.query(queryCadastroAutores, params);

        return res.json({ mensagem: 'Cadastro Realizado com Sucesso' });

    } catch (error) {
        console.log(error.message);
        return res.status(500).json({ mensagem: 'Erro no servidor' })
    }
};

const buscarAutores = async (req, res) => {
    const { id } = req.params;

    try {
        const queryBuscaAutores = 'SELECT * FROM autores WHERE id = $1';

        const params = [id];

        const resultado = await pool.query(queryBuscaAutores, params);

        return res.status(200).json(resultado.rows);

    } catch (error) {
        console.log(error.message);
        return res.status(500).json({ mensagem: 'Erro no servidor' })
    }
};


module.exports = {
    cadastrarAutor,
    buscarAutores
};