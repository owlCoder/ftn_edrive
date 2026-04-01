import { Request, Response, Router } from "express";
import { authenticate } from "../../Middlewares/authentification/AuthMiddleware";
import { IUserCharacterService } from "../../Domain/services/users/IUserCharacterService";

export class CollectionController {
  private router: Router;
  private userCharacterService: IUserCharacterService;

  constructor(userCharacterService: IUserCharacterService) {
    this.router = Router();
    this.userCharacterService = userCharacterService;
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    this.router.get("/collection", authenticate, this.getMyCollection.bind(this));
    this.router.post("/collection", authenticate, this.addToCollection.bind(this));
    this.router.put("/collection/:id", authenticate, this.updateCollectionItem.bind(this));
    this.router.delete("/collection/:id", authenticate, this.removeFromCollection.bind(this));
  }

  private async getMyCollection(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user?.id;
      if (!userId) {
        res.status(401).json({ success: false, message: 'Unauthorized' });
        return;
      }

      const collection = await this.userCharacterService.getUserCollection(userId);
      res.status(200).json({ success: true, data: collection });
    } catch (error) {
      console.error('Get collection error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async addToCollection(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user?.id;
      if (!userId) {
        res.status(401).json({ success: false, message: 'Unauthorized' });
        return;
      }

      const { characterId, level, constellation, weaponName, refinement } = req.body;

      // TODO: Validacija inputa

      const result = await this.userCharacterService.addCharacterToCollection(
        userId, characterId, { level, constellation, weaponName, refinement }
      );

      if (result.id === 0) {
        res.status(400).json({ success: false, message: 'Failed to add character to collection (maybe already exists)' });
        return;
      }
      res.status(201).json({ success: true, message: 'Character added to collection', data: result });
    } catch (error) {
      console.error('Add to collection error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async updateCollectionItem(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid collection item ID' });
        return;
      }

      const { level, constellation, weaponName, refinement } = req.body;

      const updated = await this.userCharacterService.updateUserCharacter(id, { level, constellation, weaponName, refinement });
      if (updated.id === 0) {
        res.status(404).json({ success: false, message: 'Collection item not found or update failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'Collection item updated', data: updated });
    } catch (error) {
      console.error('Update collection error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async removeFromCollection(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid collection item ID' });
        return;
      }

      const success = await this.userCharacterService.removeFromCollection(id);
      if (!success) {
        res.status(404).json({ success: false, message: 'Collection item not found or removal failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'Removed from collection' });
    } catch (error) {
      console.error('Remove from collection error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}