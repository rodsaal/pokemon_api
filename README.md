# README

# pokemon_api

## Introdução
Esse é um exemplo de uma aplicação que consome a api pokeapi (https://pokeapi.co/) para retornar o nome do pokemon e suas habilidades ordenadas pelo nome

## Requisitos
- Ruby [3.0.0]
- Rails [7.0.8]

## Configuração do Ambiente
Para configurar o ambiente, é necessário apenas clonar o repositório em sua máquina

## Executando a Aplicação
Para executar a aplicação
- Inicie o servidor local usando o comando rails s
- Abra o postman
- Faça uma requisição get utilizando a url 'localhost:3000/api/pokemons/:nome_do_pokemon'

## Explicação de como otimizei a rota
Após refatorar o código criando um serviço separado para a busca de informações do Pokémon e deixando o controller mais enxuto, otimizei a rota alterando o arquivo routes.rb de:

namespace :api do
    resources :pokemons, only: [:show]
  end

para:

namespace :api do
    get 'pokemons/:id', to: 'pokemons#show'
  end

Isso deixa sua rota mais simples e explícita para a ação 'show'