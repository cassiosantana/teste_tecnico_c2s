# Projeto eBook Hub

## Propósito

A Universidade X realiza pesquisas periódicas com professores de todo o Brasil para coletar recomendações de livros para alunos. Essas pesquisas são feitas através do Google Forms, e os resultados são exportados no formato CSV.
Antes do eBook Hub, a equipe da universidade processava manualmente esses arquivos em planilhas, o que tornava o processo lento e propenso a erros. Com a funcionalidade de importação de CSV, o cadastro dos eBooks recomendados agora é feito de forma automática e eficiente.
Além disso, a plataforma oferece web scraping integrado ao site Books to Scrape, permitindo que os usuários autenticados adicionem rapidamente livros ao catálogo apenas colando um link. Isso surgiu como uma necessidade, já que muitos acessam esse site para encontrar sugestões de leitura para os alunos.
O eBook Hub funciona como um catálogo de recomendação da universidade, centralizando informações básicas dos livros e agregando valor ao processo de curadoria literária.

## Sobre o Projeto

- CRUD de eBooks (cadastro, edição, exclusão e consulta)
- Importação de eBooks via CSV com processamento assíncrono via Sidekiq
- Web Scraping para cadastro rápido de eBooks pelo site Books to Scrape
- Autenticação de Usuários na interface web
- API documentada com Swagger para operações básicas de eBooks

A importação de dados via CSV ocorre de forma assíncrona utilizando Sidekiq, garantindo melhor desempenho e escalabilidade.


## Autenticação
- MVC (Autenticação de Usuários): É necessário estar autenticado para acessar qualquer funcionalidade relacionada a eBooks.
- API: A API não possui autenticação implementada no momento.

## Documentação da API
A documentação da API está disponível via Swagger: http://localhost:3000/api-docs. Aqui você encontrará todas as rotas da API disponíveis.

## Requisitos

- **Ruby** 3.3.5 (linguagem de programação usada)
- **Rails** 7.2.2.1 (framework web usado)
- **PostgreSQL** 16 (banco de dados usado)

## Instalação

1. **Instale as dependências:**

    ```bash
    bundle install
    ```

2. **Configure o banco de dados:**

   Crie e migre o banco de dados PostgreSQL:

    ```bash
    rails db:create
    rails db:migrate
    ```
3. **Inicie o Sidekiq** (necessário para importação de eBooks via CSV):
    ```bash
    bundle exec sidekiq
    ```

4. **Executando o Servidor**
    ```bash
    rails server
    ```
5. **Acesse a aplicação:** http://localhost:3000
## Testes

1. **Para rodar os testes, execute:**

    ```bash
        rspec
    ```
## Contribuição
Se você deseja contribuir para o projeto, sinta-se à vontade para abrir um PR com suas melhorias e correções. Suas contribuições são bem-vindas!

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---