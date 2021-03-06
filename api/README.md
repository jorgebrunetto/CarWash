# Documentação

## Menu

- [Login](#login)
- [Recuperar Senha](#recuperar-senha)
- [Cadastro](#cadastro)
- [Editar Cadastro](#editar-cadastro)
- [Ajuda](#ajuda)
- [Cadastrar Serviços](#cadastrar-serviços)
- [Listar Serviços para cadastro](#listar-serviços-disponíveis-para-cadastro)
- [Aceitar e Rejeitar Serviços](#aceitar-ou-rejeitar-serviços)
- [Extrato de Lavagem](#avaliar-cliente)
- [Listagem de Todos os pedidos](#extrato-de-lavagens-com-filtro-de-data)
- [Listagem de pedidos por usuário](#listagem-detalhe-de-todos-os-pedidos)
- [Receber pagamento mensal/semanal](#listagem-de-pedidos-por-usuário)
- [Buscar lavadores mais próximos](#receber-pagamento-mensalsemanal)
- [Listar serviços de um lavador](#listar-serviços-de-um-lavador)
- [Enviar solicitação de lavagem](#enviar-solicitação-de-lavagem)
- [Realizar pagamento](#realizar-pagamento)
- [Avaliar lavador](#avaliar-lavador)
- [Listagem de usuários](#listagem-de-usuário)
- [Aceitar pedido](#aceitar-pedido)
- [Rejeitar pedido](#rejeitar-pedido)

## Login

API: http://api.carwash.tk/Api/ApiUser/Login
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request**

```
{
	"Email":"admin@carwash.com",
	"Password":"123456"
}
```

**Response**

```
{
   "Status": true,
   "Result": {
      "Id": 1,
      "RoleId": 2,
      "Name": "Joao",
      "Email": "admin@carwash.com",
      "Password":"CkcVGgdOYzq3tr7WqrgA9g==",
      "Document": "45555745587",
      "Inserted": "2017-12-30T12:29:12",
      "BirthDate": "1986-04-23T00:00:00",
      "Cep": "18050260",
      "Address": "Av. Uruguai",
      "AddressNumber": 147,
      "Complement": "",
      "District": "Santa Fé",
      "City": "Betin",
      "State": "MG",
      "PhoneNumber": "15991235665",
      "Latitude": "-19,9547039",
      "Longitude": "-44,2058859",
      "Active": true,
	  "OrderAmount": 2,
	  "ScoreAverage": 1.33,
      "Token": "HrNss8vHI1XusGlWfhPsUCqZOoupE8b+KMuFAMyrg=="
   }
}
ou
{
   "Status": false,
   "Result": "E-mail ou senha inválido."
}
```

## Recuperar Senha

**Request JSON**

```

```

**Response**

```

```

## Cadastro

API: http://api.carwash.tk/Api/ApiUser/Register
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
	"RoleId":1,
	"Name":"Lava-rápido China",
	"Email":"lvchina@uol.com.br",
	"Password":"123456",
	"Document":"44332444587",
	"BirthDate":"1986-04-23",
	"Cep":"18050010",
	"Address":"Avenida Salvador Milego",
	"AddressNumber":147,
	"Complement":"",
	"District":"Jardim Vera Cruz ",
	"City":"Sorocaba",
	"State":"SP",
	"PhoneNumber":"15991235665"
}
```

**Response**

```
{
   "Status": true,
   "Result": "Usuário cadastrado com sucesso."
}
ou
{
   "Status": false,
   "Result": "E-mail já cadastrado."
}
```

**Roles**

```
Obs: RoleId: 1=cliente, 2=lavador, 3=lava-rápido
```

## Editar Cadastro

API:
Método: Post
Authentication: Basic
user:admin, pass:CirioSete
URL: http://api.carwash.tk/Api/

**Request JSON**

```

```

**Response**

```

```

## Ajuda

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Cadastrar Serviços

API: http://api.carwash.tk/Api/ApiUser/AddServiceToWasher
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
	"Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxvQ1g==",
	"ServiceId":3,
	"SpecificPrice":10.00
}
```

**Response**

```
{
   "Status": true,
   "Result": "Serviço cadastrado com sucesso."
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Listar Serviços disponíveis para cadastro

API: http://api.carwash.tk/Api/ApiUser/ListAllServices
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
   "Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ=="
}
```

**Response**

```
{
   "Status": true,
   "Result": [
      {
         "Id": 1,
         "Name": "Lavagem Externa",
         "DefaultPrice": 10,
         "Active": true
      },
      {
         "Id": 2,
         "Name": "Secagem Externa",
         "DefaultPrice": 8,
         "Active": true
      },
      {
         "Id": 3,
         "Name": "Aspirador",
         "DefaultPrice": 10,
         "Active": true
      },
      {
         "Id": 4,
         "Name": "Pretinho",
         "DefaultPrice": 5,
         "Active": true
      },
      {
         "Id": 5,
         "Name": "Cera",
         "DefaultPrice": 60,
         "Active": true
      }
   ]
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Aceitar ou rejeitar serviços

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Avaliar Cliente

API: http://api.carwash.tk/Api/ApiUser/EvaluateUser
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
   "Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ==",
   "OrderedId":"3",
   "UserIdFrom":"2",
   "UserIdTo":"3",
   "Score":"4"
}
```

**Response**

```
{
   "Status": true,
   "Result": "Avaliação realizada com sucesso."
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Extrato de lavagens com filtro de data

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Listagem detalhe de todos os pedidos

API: http://api.carwash.tk/Api/ApiUser/ListAllOrders
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
   "Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ=="
}
```

**Response**

```
{
   "Status": true,
   "Result": [
      {
         "OrderId": 1,
         "Created": "2018-08-06T00:00:00",
         "TotalPrice": 80,
         "Status": 1,
         "UserId": 2,
         "UserName": "Lucas Martins",
         "WasherId": 3,
         "WasherName": "João Victor",
         "Itens": [
               {
                  "Id": 1,
                  "OrderId": 1,
                  "ServiceId": 3,
                  "Price": 40,
                  "ServiceName": "Aspirador"
               },
               {
                  "Id": 3,
                  "OrderId": 1,
                  "ServiceId": 3,
                  "Price": 34,
                  "ServiceName": "Aspirador"
               },
               {
                  "Id": 4,
                  "OrderId": 1,
                  "ServiceId": 4,
                  "Price": 15,
                  "ServiceName": "Pretinho"
               }
         ]
      },
      {
         "OrderId": 3,
         "Created": "2018-08-09T11:57:08",
         "TotalPrice": 15,
         "Status": 1,
         "UserId": 2,
         "UserName": "Lucas Martins",
         "WasherId": 3,
         "WasherName": "João Victor",
         "Itens": [
{
                  "Id": 7,
                  "OrderId": 3,
                  "ServiceId": 4,
                  "Price": 15,
                  "ServiceName": "Pretinho"
               }
]
      }
   ]
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

**Status**

```
   OBS: Campo Status pode ser:
   1-Iniciado
   2-Cancelado
   3-Negado
   4-Aceito
   5-Finalizado
```

## Listagem de pedidos por usuário

API: http://api.carwash.tk/Api/ApiUser/ListOrderByUser
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
   "Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ=="
}
```

**Response**

```
{
   "Status": true,
   "Result": [
      {
         "OrderId": 1,
         "Created": "2018-08-06T00:00:00",
         “ScheduledDateTime”:”2018-08-06T00:00:00”,
         "TotalPrice": 80,
         "Status": 1,
         "UserId": 2,
         "UserName": "Lucas Martins",
         "WasherId": 3,
         "WasherName": "João Victor",
		 "Evaluation": 1,
		 "UserScoreAverage": 1.33,
		 "WasherScoreAverage": 1,
         "Itens": [
               {
                  "Id": 1,
                  "OrderId": 1,
                  "ServiceId": 3,
                  "Price": 40,
                  "ServiceName": "Aspirador"
               },
               {
                  "Id": 3,
                  "OrderId": 1,
                  "ServiceId": 3,
                  "Price": 34,
                  "ServiceName": "Aspirador"
               },
               {
                  "Id": 4,
                  "OrderId": 1,
                  "ServiceId": 4,
                  "Price": 15,
                  "ServiceName": "Pretinho"
               }
         ]
      },
      {
         "OrderId": 3,
         "Created": "2018-08-09T11:57:08",
         “ScheduledDateTime”:”2018-08-06T00:00:00”,
         "TotalPrice": 15,
         "Status": 1,
         "UserId": 2,
         "UserName": "Lucas Martins",
         "WasherId": 3,
         "WasherName": "João Victor",
         "Itens": [
{
                  "Id": 7,
                  "OrderId": 3,
                  "ServiceId": 4,
                  "Price": 15,
                  "ServiceName": "Pretinho"
               }
]
      }
   ]
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

**Status**

```
   OBS: Campo Status pode ser:
   1-Iniciado
   2-Cancelado
   3-Negado
   4-Aceito
   5-Finalizado
```

## Receber pagamento mensal/semanal

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Buscar Lavadores mais próximos

API: http://api.carwash.tk/Api/ApiUser/ListWashers
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
"Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ==",
	"MaxRadius":9, (Km)
	"Latitude":"-23.5147493",
	"Longitude":"-47.4917236"
}
```

**Response**

```
{
   "Status": true,
   "Result": [
      {
         "Id": 1,
         "RoleId": 2,
         "Name": "Ana Furtado",
         "Email": "anaf@gmail.com",
         "Document": "56548755978",
         "Inserted": "2017-09-12T00:00:00",
         "BirthDate": "2001-11-23T00:00:00",
         "Cep": "13841200",
         "Address": "Rua Elias Barreto",
         "AddressNumber": 985,
         "Complement": "",
         "District": "Vila Canária",
         "City": "Salvador",
         "State": "BA",
         "PhoneNumber": "55889887644",
         "Latitude": "-22,5147493",
         "Longitude": "-46,4917236",
         "Active": true,
		 "OrderAmount": 1,
         "ScoreAverage": null,
		 "MinPrice": 15.00
      },
      {
         "Id": 3,
         "RoleId": 2,
         "Name": "João Victor",
         "Email": "joaovictor@gmail.com",
         "Document": "87874478955",
         "Inserted": "2017-10-10T00:00:00",
         "BirthDate": "1999-10-10T00:00:00",
         "Cep": "18017555",
         "Address": "Rua João de Barros",
         "AddressNumber": 334,
         "Complement": "",
         "District": "Mangueirão",
         "City": "Belém",
         "State": "Pará",
         "PhoneNumber": "89991223344",
         "Latitude": "-19,5147493",
         "Longitude": "-43,4917236",
         "Active": true,
		 "OrderAmount": 1,
         "ScoreAverage": 3.5,
		 "MinPrice": 25.00
      }
   ]
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Listar Serviços de um lavador

API: http://api.carwash.tk/Api/ApiUser/ListServicesByWasher
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
"Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ==",
	"WasherId”: 1
}
```

**Response**

```
{
   "Status": true,
   "Result": [
      {
         "UserId": 1,
         "ServiceId": 1,
         "Name": "Lavagem Externa",
         "DefaultPrice": 10,
         "SpecificPrice": 0
      },
      {
         "UserId": 1,
         "ServiceId": 2,
         "Name": "Secagem Externa",
         "DefaultPrice": 8,
         "SpecificPrice": 0
      }
   ]
}
ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Enviar solicitação de lavagem

API: http://api.carwash.tk/Api/ApiUser/CreateOrder
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
	"Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ==",
	"UserId":"2",
	"WasherId":"3",
	"TotalPrice":25.00,
	"ScheduledDateTime":"2018-09-12 17:00",
	"ListItens":[
		{
			"ServiceId":3,
			"Price":34.00
		},
		{
			"ServiceId":4,
			"Price":15.00
		}
   ]
}
```

**Response**

```
{
   "Status": true,
   "Result": {
      “OrderId”: 23167,
      “Message”:”Pedido criado com sucesso.”
   }
}
Ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Realizar pagamento

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Avaliar lavador

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Listagem de Usuário

API: http://api.carwash.tk/Api/
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```

```

**Response**

```

```

## Aceitar pedido

API: http://api.carwash.tk/Api/ApiUser/AcceptOrder
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
	"Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ==",
	"OrderId":"8"
}
```

**Response**

```
{
   "Status": true,
   "Result": "Pedido aceito com sucesso."
}
Ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```

## Rejeitar pedido

API: http://api.carwash.tk/Api/ApiUser/RejectOrder
Método: Post
Authentication: Basic
user:admin, pass:CirioSete

**Request JSON**

```
{
	"Token":"oT2Bqams7mpiwyI7HN+B1Vxd6dp7apY8KxGCKVjoQ==",
	"OrderId":"8"
}
```

**Response**

```
{
   "Status": true,
   "Result": "Pedido rejeitado com sucesso."
}
Ou
{
   "Status": false,
   "Result": "Erro genérico."
}
```
