# Qulture Challenge API com Ruby on Rails

## Referências
- [Documentação do Docker](https://docs.docker.com/)

## Descrição
Este projeto é uma aplicação backend desenvolvida com Ruby on Rails, oferecendo uma API para gerenciamento de empresas e seus funcionários. O projeto inclui algumas operações CRUD para empresas e funcionários, além de rotas para a promoção e listagem de relações hierárquicas entre funcionários.

## Tecnologias Utilizadas
- Ruby on Rails
- PostgreSQL
- Docker e Docker Compose

---

## Configuração do Projeto com Docker Compose

### Requisitos
Certifique-se de ter os seguintes softwares instalados:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Passo a Passo
1. Clone o repositório:
   ```bash
   git clone git@github.com:lucsduartee/qulture-challenge-api.git
   cd qulture-challenge-api
   ```

2. Certifique-se de que o Docker esteja em execução.

3. Construa e inicie os contêineres:
   ```bash
   docker-compose up --build
   ```

4. Acesse a aplicação em [http://localhost:3000](http://localhost:3000).

### Comandos úteis
- Parar os contêineres:
  ```bash
  docker-compose down
  ```
- Ver os logs:
  ```bash
  docker-compose logs -f
  ```

---

## Rotas da API

| Método | Endpoint                                | Descrição                               |              Payload                  |
|--------|-----------------------------------------|-----------------------------------------|---------------------------------------|
| GET    | /api/companies                          | Lista todas as empresas                 |                                       |
| POST   | /api/companies                          | Cria uma nova empresa                   |            { "name": " " }            |
| GET    | /api/companies/:id                      | Mostra uma empresa específica           |                                       |
| GET    | /api/companies/:company_id/employees    | Lista os funcionários de uma empresa    |                                       |
| POST   | /api/companies/:company_id/employees    | Cria um novo funcionário para a empresa |{"email": "","name": "","picture":  ""}|
| DELETE | /api/employees/:id                      | Exclui um funcionário                   |                                       |
| POST   | /api/employees/:id/promote              | Promove um funcionário                  |       {"employee_id": <number> }      |
| GET    | /api/employees/:id/peers                | Lista colegas de um funcionário         |                                       |
| GET    | /api/employees/:id/subordinates         | Lista subordinados de um funcionário    |                                       |
| GET    | /api/employees/:id/deep_subordinates    | Lista subordinados em todos os níveis   |                                       |

---
