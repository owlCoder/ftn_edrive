# oib-eshop

Monorepo za e-shop projekat iz predmeta OIB (Osnove informacione bezbednosti).
Spojeno iz tri ranije odvojena repoa (juni 2026).

Sadrži **dve implementacije** istog projekta:

## 1. Mikroservisna verzija — [`eshop/`](eshop/)

| Pod-folder | Šta je |
|---|---|
| `eshop/client/` | Frontend (React + Vite) |
| `eshop/infrastructure/gateway-api/` | API gateway (Express) |
| `eshop/infrastructure/microservices/auth-microservice/` | Autentikacija |
| `eshop/infrastructure/microservices/user-microservice/` | Korisnici |
| `eshop/infrastructure/microservices/plant-microservice/` | Proizvodi (biljke) |

## 2. Monolitna / Firebase verzija

| Folder | Šta je |
|---|---|
| [`api/`](api/) | REST API (Express + Firebase) |
| [`ui/`](ui/) | Frontend (React) |

## Pokretanje

U svakom servisu: `cp .env.example .env` → popuni vrednosti → `npm install` → `npm run dev`.
Za `api/` dodatno: `cp serviceAccount.example.json serviceAccount.json` i popuni Firebase admin kredencijale.

> Sve tajne (`.env`, `serviceAccount.json`) su gitignored i uklonjene pri spajanju.
> **Rotiraj** Firebase admin ključ ako je ikada bio u javnom repou.
