# Shipping-app
Este é um projeto que está sendo desenvolvido durante o treinamento da Campus Code - TreinaDev.

Com este projeto tenho o objetivo adquirir mais conhecimento através da prática, além de ser utilizado como avaliação da primeira etapa do treinamento.

Obs.: O arquivo de Readme, bem como todo o projeto, será constantemente atualizado até a conclusão do projeto. O prazo estimado de conclusão é até o dia 29/05/2022.

## Tecnologias utilizadas

```bash
    Ruby 3.0.0
    Rails 7.0.3
    Rspec
    Capybara
    Bootstrap 5.1.3
```

## Layouts

```bash
    Stylish Portfolio - Utilizado no site - https://startbootstrap.com/theme/stylish-portfolio
    SB Admin - Utilizado na aplicação - https://startbootstrap.com/template/sb-admin
```

## Baixando e instalando a aplicação

```bash
    git clone git@github.com:davide-almeida/shipping-app.git
    cd shipping-app
    gem install bundler
    gem install foreman
    bundle install
    yarn install
    rails css:install:bootstrap
    rails javascript:install:esbuild
    rails db:create db:migrate db:seed
    foreman start -f Procfile.dev
```

## Como acessar
Após utilizar o comando `foreman start -f Procfile.dev` a aplicação estará disponível no endereço `http://localhost:3000`.

Para acessar como Administrador(a) navegue até o menu superior direito e click em `Acesso Admin` e utilize o login `davide@sistemadefrete.com.br` e senha `123123`. 

Para acessar como usuário de uma transportadora navegue até botão `Acesso Transportadora` e utilize o login `transportadora@shippingcompany1.com` e senha `123123`.

Para rastrear um pedido navegue até o botão `Rastreio` e informe o código de um rastreio. O pedido deve está previamente cadastrado e configurado utilizando os acessos anteriores.

Obs.: Mais dados de acesso podem ser consultados ou adicionados no arquivo `seed.rb`.
