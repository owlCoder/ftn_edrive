import { Request, Response, Router } from "express";
import { IGatewayService } from "../Domain/services/IGatewayService";
import { LoginUserDTO } from "../Domain/DTOs/LoginUserDTO";
import { RegistrationUserDTO } from "../Domain/DTOs/RegistrationUserDTO";
import { authenticate } from "../Middlewares/authentification/AuthMiddleware";
import { authorize } from "../Middlewares/authorization/AuthorizeMiddleware";
import { PlantDTO } from "../Domain/DTOs/PlantDTO";

export class GatewayController {
  private readonly router: Router;

  constructor(private readonly gatewayService: IGatewayService) {
    this.router = Router();
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    // Auth
    this.router.post("/login", this.login.bind(this));
    this.router.post("/register", this.register.bind(this));

    // Users
    this.router.get("/users", authenticate, authorize("admin"), this.getAllUsers.bind(this));
    this.router.get("/users/:id", authenticate, authorize("admin", "seller"), this.getUserById.bind(this));

    // Plants
    this.router.get("/plants", authenticate, authorize("admin", "seller"), this.getAllPlants.bind(this));
    this.router.get("/plants/:id", authenticate, authorize("admin", "seller"), this.getPlantById.bind(this));
    this.router.post("/plants", authenticate, authorize("admin"), this.createPlant.bind(this));
    this.router.put("/plants/:id", authenticate, authorize("admin"), this.updatePlant.bind(this));
    this.router.delete("/plants/:id", authenticate, authorize("admin"), this.deletePlant.bind(this));
  }

  // Auth
  private async login(req: Request, res: Response): Promise<void> {
    const data: LoginUserDTO = req.body;
    const result = await this.gatewayService.login(data);
    res.status(200).json(result);
  }

  private async register(req: Request, res: Response): Promise<void> {
    const data: RegistrationUserDTO = req.body;
    const result = await this.gatewayService.register(data);
    res.status(200).json(result);
  }

  // Users
  private async getAllUsers(req: Request, res: Response): Promise<void> {
    try {
      const users = await this.gatewayService.getAllUsers();
      res.status(200).json(users);
    } catch (err) {
      res.status(500).json({ message: (err as Error).message });
    }
  }

  private async getUserById(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id, 10);
      if (!req.user || req.user.id !== id) {
        res.status(401).json({ message: "You can only access your own data!" });
        return;
      }

      const user = await this.gatewayService.getUserById(id);
      res.status(200).json(user);
    } catch (err) {
      res.status(404).json({ message: (err as Error).message });
    }
  }

  // Plants
  private async getAllPlants(req: Request, res: Response): Promise<void> {
    const plants = await this.gatewayService.getAllPlants();
    res.status(200).json(plants);
  }

  private async getPlantById(req: Request, res: Response): Promise<void> {
    const id = parseInt(req.params.id, 10);
    const plant = await this.gatewayService.getPlantById(id);
    res.status(200).json(plant);
  }

  private async createPlant(req: Request, res: Response): Promise<void> {
    const data: PlantDTO = req.body;
    const newPlant = await this.gatewayService.createPlant(data);
    res.status(201).json(newPlant);
  }

  private async updatePlant(req: Request, res: Response): Promise<void> {
    const id = parseInt(req.params.id, 10);
    const data: PlantDTO = req.body;
    const updated = await this.gatewayService.updatePlant(id, data);
    res.status(200).json(updated);
  }

  private async deletePlant(req: Request, res: Response): Promise<void> {
    const id = parseInt(req.params.id, 10);
    const success = await this.gatewayService.deletePlant(id);
    res.status(success ? 200 : 404).json({ success });
  }

  public getRouter(): Router {
    return this.router;
  }
}
