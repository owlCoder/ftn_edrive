import { Request, Response, Router } from "express";
import { ICharacterService } from "../../Domain/services/characters/ICharacterService";
import { authenticate } from "../../Middlewares/authentification/AuthMiddleware";
import { authorize } from "../../Middlewares/authorization/AuthorizeMiddleware";

export class CharacterController {
  private router: Router;
  private characterService: ICharacterService;

  constructor(characterService: ICharacterService) {
    this.router = Router();
    this.characterService = characterService;
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    // Javne rute
    this.router.get("/characters", this.getAllCharacters.bind(this));
    this.router.get("/characters/:id", this.getCharacterById.bind(this));
    this.router.get("/characters/filter", this.filterCharacters.bind(this));

    // Admin rute
    this.router.post("/characters", authenticate, authorize("admin"), this.createCharacter.bind(this));
    this.router.put("/characters/:id", authenticate, authorize("admin"), this.updateCharacter.bind(this));
    this.router.delete("/characters/:id", authenticate, authorize("admin"), this.deleteCharacter.bind(this));
  }

  private async getAllCharacters(req: Request, res: Response): Promise<void> {
    try {
      const characters = await this.characterService.getAllCharacters();
      res.status(200).json({ success: true, data: characters });
    } catch (error) {
      console.error('Get all characters error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async getCharacterById(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid character ID' });
        return;
      }

      const character = await this.characterService.getCharacterById(id);
      if (character.id === 0) {
        res.status(404).json({ success: false, message: 'Character not found' });
        return;
      }
      res.status(200).json({ success: true, data: character });
    } catch (error) {
      console.error('Get character by id error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async filterCharacters(req: Request, res: Response): Promise<void> {
    try {
      const { element, weaponType, rarity } = req.query;
      const rarityNum = rarity ? parseInt(rarity as string) : undefined;
      const characters = await this.characterService.filterCharacters(
        element as string,
        weaponType as string,
        rarityNum
      );
      res.status(200).json({ success: true, data: characters });
    } catch (error) {
      console.error('Filter characters error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async createCharacter(req: Request, res: Response): Promise<void> {
    try {
      const { name, element, weaponType, rarity, region, description, image } = req.body;

      // TODO: Validacija obaveznih polja

      const character = await this.characterService.createCharacter({
        name, element, weaponType, rarity, region, description, image
      });

      if (character.id === 0) {
        res.status(400).json({ success: false, message: 'Character creation failed' });
        return;
      }
      res.status(201).json({ success: true, message: 'Character created', data: character });
    } catch (error) {
      console.error('Create character error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async updateCharacter(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid character ID' });
        return;
      }

      const updateData = req.body;
      const updated = await this.characterService.updateCharacter(id, updateData);
      if (updated.id === 0) {
        res.status(404).json({ success: false, message: 'Character not found or update failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'Character updated', data: updated });
    } catch (error) {
      console.error('Update character error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async deleteCharacter(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid character ID' });
        return;
      }

      const success = await this.characterService.deleteCharacter(id);
      if (!success) {
        res.status(404).json({ success: false, message: 'Character not found or deletion failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'Character deleted' });
    } catch (error) {
      console.error('Delete character error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}