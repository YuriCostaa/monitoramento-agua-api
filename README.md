# Monitoramento de Consumo de Água

API REST para registrar e consultar leituras de hidrômetros, com autenticação JWT e um dashboard web simples. Projeto acadêmico desenvolvido na Universidade Católica de Brasília (UCB).

## Funcionalidades

- Login com geração de token JWT (`/api/auth/login`)
- CRUD de leituras de hidrômetro com filtros (`/api/leituras`)
- Simulação de leituras para testes
- Dashboard em HTML/JavaScript para visualizar as leituras

## Tecnologias

- Java 17 e Spring Boot 3.2
- Spring Web, Spring Data JPA e Spring Security
- JWT (jjwt)
- MySQL
- Lombok
- HTML, CSS e JavaScript no front-end

## Estrutura

```
src/main/java/com/example/monitoramentoagua
├── config       # Segurança (JWT) e CORS
├── domain       # Entidades: Imóvel, Hidrômetro, Leitura, Contrato, Usuário...
├── dto          # Objetos de entrada e saída da API
├── repository   # Repositórios JPA
├── service      # Regras de negócio (autenticação, leituras, simulação)
└── web          # Controllers REST
data/            # Script SQL do banco
index.html, js/  # Dashboard
```

## Endpoints

| Método | Rota | Descrição |
|---|---|---|
| POST | `/api/auth/login` | Autentica o usuário e retorna o token |
| GET | `/api/leituras` | Lista leituras (aceita filtros) |
| POST | `/api/leituras` | Registra uma leitura |
| PUT | `/api/leituras/{id}` | Atualiza uma leitura |
| DELETE | `/api/leituras/{id}` | Remove uma leitura |

## Como executar

1. Crie o banco no MySQL com o script `data/monitoramentoconsumodeagua.sql`.
2. Defina as variáveis de ambiente com as credenciais do banco e a chave do JWT:
   ```bash
   export DB_USERNAME=root
   export DB_PASSWORD=sua_senha
   export JWT_SECRET=uma_chave_longa_e_aleatoria
   ```
3. Rode a aplicação:
   ```bash
   mvn spring-boot:run
   ```
4. Abra o `index.html` no navegador para usar o dashboard.
