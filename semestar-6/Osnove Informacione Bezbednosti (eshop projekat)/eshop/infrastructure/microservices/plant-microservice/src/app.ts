import express from "express";
import cors from "cors";
import "reflect-metadata";
import dotenv from "dotenv";
import { Repository } from "typeorm";
import { initialize_database } from "./Database/InitializeConnection";
import { Db } from "./Database/DbConnectionPool";
import { ILogerService } from "./Domain/services/ILogerService";
import { LogerService } from "./Services/LogerService";
import { Plant } from "./Domain/models/Plant";
import { IPlantsService } from "./Domain/services/IPlantsService";
import { PlantsService } from "./Services/PlantsService";
import { PlantsController } from "./WebAPI/controllers/PlantController";

dotenv.config({ quiet: true });

// App initialization
const app = express();

// CORS Configuration
const corsOrigin = process.env.CORS_ORIGIN ?? "*";
const corsMethods = process.env.CORS_METHODS?.split(",").map(m => m.trim()) ?? ["GET", "POST", "PUT", "DELETE"];

app.use(cors({ origin: corsOrigin, methods: corsMethods }));
app.use(express.json());

// Database Initialization
initialize_database();

// Repository
const plantRepository: Repository<Plant> = Db.getRepository(Plant);

// Services
const loggerService: ILogerService = new LogerService();
const plantsService: IPlantsService = new PlantsService(plantRepository);

// Controllers
const plantsController = new PlantsController(plantsService, loggerService);

// Routing
app.use("/api/v1", plantsController.getRouter());

export default app;
