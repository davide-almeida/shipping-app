# Shipping-app
Este projeto foi desenvolvido durante o treinamento da `Campus Code - TreinaDev`. E, com ele, tive a oportunidade de adquirir conhecimento e boas práticas de desenvolvimento baseadas em testes, além de ser utilizado como avaliação da primeira etapa do treinamento.

## Tecnologias utilizadas

```bash
    Ruby 3.0.0
    Rails 7.0.3
    Rspec
    Capybara
    Bootstrap 5.1.3
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
Obs.: Após realizar a instalação vá até a pasta raiz do projeto e procure o arquivo `app/javascript/application.js` e remova a linha `import * as bootstrap from "bootstrap"` que foi gerada automaticamente após instalar o bootstrap.

## Como acessar
Após utilizar o comando `foreman start -f Procfile.dev` a aplicação estará disponível no endereço `http://localhost:3000`.

Para acessar como Administrador(a) navegue até o menu superior direito e click em `Acesso Admin` e utilize o login `davide@sistemadefrete.com.br` e senha `123123`. 

Para acessar como usuário de uma transportadora navegue até botão `Acesso Transportadora` e utilize o login `transportadora@shippingcompany1.com` e senha `123123`.

Para rastrear um pedido navegue até o botão `Rastreio` e informe o código de um rastreio. O pedido deve está previamente cadastrado e configurado utilizando os acessos anteriores.

Obs.: Mais dados de acesso podem ser consultados ou adicionados no arquivo `seed.rb`.

## Modelo do banco de dados
<div align="center">
    <img src="https://user-images.githubusercontent.com/85287720/170897498-6c40f59d-c873-4a16-a3be-41610329e4fb.png">
</div>

## Capturas de tela
1. Tela principal
<div align="center">
    <img src="https://user-images.githubusercontent.com/85287720/170899714-1dff6251-e371-4093-ad10-bda805752631.png">
</div>

2. Admin - Busca de preços
<div align="center">
    <img src="https://user-images.githubusercontent.com/85287720/170899975-a691d03c-3f76-45e9-bd86-62fddf355cfc.png">
</div>

3. Transportadora - Ordens de serviço
<div align="center">
    <img src="https://user-images.githubusercontent.com/85287720/170900531-a83108d1-4a4d-4ff9-8418-8e4a3e2534e8.png">
</div>

4. Transportadora - Atualizando rota de entrega
<div align="center">
    <img src="https://user-images.githubusercontent.com/85287720/170900803-8efb4212-6b7b-41bd-8f94-03fbb487706c.png">
</div>

5. Rastreio
<div align="center">
    <img src="https://user-images.githubusercontent.com/85287720/170900988-0f8a8610-da86-4f8e-bc68-18a442abbf1a.png">
</div>

## Layouts

```bash
    Stylish Portfolio - Utilizado no site - https://startbootstrap.com/theme/stylish-portfolio
    SB Admin - Utilizado na aplicação - https://startbootstrap.com/template/sb-admin
```
