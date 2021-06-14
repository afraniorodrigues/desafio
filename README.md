# Desafio

Desafio para construção de uma aplicação (apenas API) utilizando Ruby on Rails ou Elixir, que contenham as seguintes funcionalidades:
* Cadastro e login de usuários ( CPF, Email e Telefone e senha)
* Validação de CPF, Email e Telefone;
* Cadastro de tarefas do usuário (nome, data, hora);
* O usuário poderá enviar uma tabela (do excel) contendo uma lista de tarefas e o sistema deverá adicioná-las no banco de dados;
* Uma funcionalidade de sua escolha, use a criatividade, pense em algo que agregue valor para esse produto e implemente!

Tabela de conteúdos
=================
<!--ts-->
   * [Requisitos](#requisitos)
   * [Melhorias](#melhorias)
   * [Instalação](#instalação)
   * [API](#api)
      * [Cadastro de Usuário](#cadastro-de-usuário)
      * [Credenciais de Acesso](#credenciais-de-acesso)
      * [Tarefas](#tarefas)
      * [Tarefas Excel](#tarefas-excel)
   * [Testes](#testes)
   * [Tecnologias](#tecnologias)
   * [Melhorias Futuras](#melhorias-futuras)
<!--te-->

# Requisitos

* O código deve estar upado no GitHub de forma pública;
* O código deve ser escrito de forma limpa e semântica;
* Documentação do sistema - Informações básicas de uso, endpoints e peculiaridades. (pode usar uma collection no postman para ajudar ou o
próprio README).

# Melhorias
As melhorias são opcionais e são:
* Adicionar confirmação de cadastro por email;
* Informar o usuário por email (pode ser email local) 10 minutos antes da sua tarefa;
* Docker e docker-compose configurados com ambiente inteiro rodando em
container;
* Aplicação rodando em "Produção";
* Utilizar serviços da AWS (Cognito, DynamoDB e etc..).

# Instalação

Para instalar o sistema é necessário o uso do docker. Para instalar a aplicação basta rodar os comandos abaixo:

```sh
docker-compose build
docker-compose up -d
```

O serviço esta configurado para rodar na porta 3000.
# API
## Cadastro de Usuário

----
  _Cadastra um usuário no sistema. O cpf precisa conter 11 números e ser um cpf válido e o telefone precisa estar no formato '(XX) XXXX-XXXX' ou '(XX) XXXXX-XXXX', onde X representa números inteiros._

* **URL**
```http
  /auth
```
* **Method:**

  _Tipos de Métodos_

  `POST`

* **Data Params**

   `nome=[string]` <br>
   `email=[string]` <br>
   `cpf=[string]` <br>
   `telefone=[string]` <br>

* **Success Response:**

  * **Code:** 204 <br />
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />

## Credenciais de Acesso
----
  _Gera as credencias de acesso da API. As credencias são devolvidas no **header** da requisição ._

* **URL**
```http
  /auth/sign_in
```
* **Method:**

  _Tipos de Métodos_

  `POST`

* **Data Params**

   `email=[string]` <br>
   `password=[string]` <br>

* **Success Response:**

  * **Code:** 200 <br />
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
## Tarefas
----
  _Agenda de tarefas com nome, data e hora._

* **URL**

```http
  /ap1/tarefas
```

* **Method:**
  
  _Tipos de Métodos_

  `GET` | `POST` | `DELETE` | `PUT`
  

* **Data Params**

   `nome=[string]` <br>
   `data=[string]` <br>
   `hora=[string]` <br>

* **Headers Params**

   `uid=[string]` <br>
   `client=[string]` <br>
   `token=[string]` <br>

* **Success Response:**
  
  * **Code:** 200 OK<br />
  * **Code:** 204 NO CONTENT<br />
 
* **Error Response:**

  * **Code:** 400 BAD REQUEST <br />
  * **Code:** 401 UNAUTHORIZED <br />
  * **Code:** 404 NOT FOUND <br />

## Tarefas CSV
----
  _**Funcionalidade Extra:** Agenda de tarefas com nome, data e hora no formato csv. Este formato é de grande importância por ser usado em várias análises principalmente em ciência de dados e big data._

* **URL**
```http
  /api/v1/tarefas.csv
```
* **Method:**

  _Tipos de Métodos_

  `GET`

* **Headers Params**

   `uid=[string]` <br>
   `client=[string]` <br>
   `token=[string]` <br>

* **Success Response:**

  * **Code:** 200 <br />
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />


## Tarefas Excel

----
  _Envia um arquivo de excel, formato xlsx, para o sistema e grava as informações no banco de dados. O arquivo excel precisa ter as seguintes formatações: **Coluna A**: nome da tarefa, **Coluna B**: data da tarefa, **Coluna C**: Hora da tarefa._

* **URL**
```http
  /api/v1/tarefas_excel
```
* **Method:**

  _Tipos de Métodos_

  `POST`

* **Data Params**

  `file = *.xlsx`

* **Headers Params**

   `uid=[string]` <br>
   `client=[string]` <br>
   `token=[string]` <br>

* **Success Response:**

  * **Code:** 204 <br />
 
* **Error Response:**

  * **Code:** 400 BAD REQUEST <br />

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{"errors": ["Para continuar, faça login ou registre-se."]}`

# Testes
Neste projeto foi implementado testes, **rspec**, porém eles não foram utilizados como deveriam, ficando esta funcionalidade listada como melhorias futuras.

# Tecnologias

* Docker
* Ruby
* Ruby on Rails
* Visual Studio Code

# Melhorias Futuras

[ &nbsp; ] **Tag**: Agrupar as tarefas por tags; <br>
[ &nbsp; ] **Flag**: Marcar se a tarefa já foi concluida ou não; <br>
[ &nbsp; ] **Filtros**: Filtrar tarefas por datas e tags; <br>
[ &nbsp; ] **Testes**: Melhorar a qualidade dos testes. <br>