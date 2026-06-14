import { Router, Request, Response } from "express";
import { ILogerService } from "../../Domain/services/ILogerService";
import { IPlantsService } from "../../Domain/services/IPlantsService";
import { Plant } from "../../Domain/models/Plant";

export class PlantsController {
  private readonly router: Router;

  constructor(
    private readonly plantsService: IPlantsService,
    private readonly logger: ILogerService
  ) {
    this.router = Router();
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    this.router.get("/plants", this.getAllPlants.bind(this));
    this.router.get("/plants/:id", this.getPlantById.bind(this));
    this.router.post("/plants", this.createPlant.bind(this));
    this.router.put("/plants/:id", this.updatePlant.bind(this));
    this.router.delete("/plants/:id", this.deletePlant.bind(this));
  }

  /** GET all plants */
  private async getAllPlants(req: Request, res: Response): Promise<void> {
    try {
      this.logger.log("Fetching all plants");
      const plants = await this.plantsService.getAllPlants();
      res.status(200).json(plants);
    } catch (err) {
      this.logger.log((err as Error).message);
      res.status(500).json({ message: (err as Error).message });
    }
  }

  /** GET a plant by ID */
  private async getPlantById(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id, 10);
      this.logger.log(`Fetching plant with ID ${id}`);
      const plant = await this.plantsService.getPlantById(id);
      res.status(200).json(plant);
    } catch (err) {
      this.logger.log((err as Error).message);
      res.status(404).json({ message: (err as Error).message });
    }
  }

  /** POST create new plant */
  private async createPlant(req: Request, res: Response): Promise<void> {
    try {
      const plant: Plant = req.body;
      this.logger.log("Creating new plant");
      const createdPlant = await this.plantsService.createPlant(plant);
      res.status(201).json(createdPlant);
    } catch (err) {
      this.logger.log((err as Error).message);
      res.status(500).json({ message: (err as Error).message });
    }
  }

  /** PUT update existing plant */
  private async updatePlant(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id, 10);
      const plant: Plant = req.body;
      this.logger.log(`Updating plant with ID ${id}`);
      const updatedPlant = await this.plantsService.updatePlant(id, plant);
      res.status(200).json(updatedPlant);
    } catch (err) {
      this.logger.log((err as Error).message);
      res.status(404).json({ message: (err as Error).message });
    }
  }

  /** DELETE plant by ID */
  private async deletePlant(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id, 10);
      this.logger.log(`Deleting plant with ID ${id}`);
      const deleted = await this.plantsService.deletePlant(id);
      if (!deleted) {
        res.status(404).json({ message: `Plant with ID ${id} not found` });
        return;
      }
      res.status(200).json({ success: true});
    } catch (err) {
      this.logger.log((err as Error).message);
      res.status(500).json({ message: (err as Error).message });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}
