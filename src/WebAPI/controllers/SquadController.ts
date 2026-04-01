import { Request, Response, Router } from "express";
import { ISquadService } from "../../Domain/services/squads/ISquadService";
import { authenticate } from "../../Middlewares/authentification/AuthMiddleware";
import { ISquadMemberService } from "../../Domain/services/squads/ISquadMemberService";

export class SquadController {
  private router: Router;
  private squadService: ISquadService;
  private squadMemberService: ISquadMemberService;

  constructor(squadService: ISquadService, squadMemberService: ISquadMemberService) {
    this.router = Router();
    this.squadService = squadService;
    this.squadMemberService = squadMemberService;
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    this.router.get("/squads", authenticate, this.getMySquads.bind(this));
    this.router.get("/squads/:id", authenticate, this.getSquadById.bind(this));
    this.router.post("/squads", authenticate, this.createSquad.bind(this));
    this.router.put("/squads/:id", authenticate, this.updateSquad.bind(this));
    this.router.delete("/squads/:id", authenticate, this.deleteSquad.bind(this));

    // Rute za članove odreda
    this.router.post("/squads/:squadId/members", authenticate, this.addMember.bind(this));
    this.router.delete("/squads/:squadId/members/:memberId", authenticate, this.removeMember.bind(this));
  }

  private async getMySquads(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user?.id;
      if (!userId) {
        res.status(401).json({ success: false, message: 'Unauthorized' });
        return;
      }

      const squads = await this.squadService.getUserSquads(userId);
      res.status(200).json({ success: true, data: squads });
    } catch (error) {
      console.error('Get my squads error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async getSquadById(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid squad ID' });
        return;
      }

      const squad = await this.squadService.getSquadById(id);
      if (squad.id === 0) {
        res.status(404).json({ success: false, message: 'Squad not found' });
        return;
      }

      // Proveriti da li korisnik ima pravo da vidi ovaj odred (mora biti vlasnik)
      const userId = req.user?.id;
      if (squad.userId !== userId) {
        res.status(403).json({ success: false, message: 'Forbidden' });
        return;
      }

      const members = await this.squadMemberService.getMembersBySquad(squad.id);
      res.status(200).json({ success: true, data: { ...squad, members } });
    } catch (error) {
      console.error('Get squad by id error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async createSquad(req: Request, res: Response): Promise<void> {
    try {
      const userId = req.user?.id;
      if (!userId) {
        res.status(401).json({ success: false, message: 'Unauthorized' });
        return;
      }

      const { name } = req.body;
      if (!name || name.trim().length === 0) {
        res.status(400).json({ success: false, message: 'Squad name is required' });
        return;
      }

      const squad = await this.squadService.createSquad(userId, name);
      if (squad.id === 0) {
        res.status(400).json({ success: false, message: 'Squad creation failed' });
        return;
      }
      res.status(201).json({ success: true, message: 'Squad created', data: squad });
    } catch (error) {
      console.error('Create squad error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async updateSquad(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid squad ID' });
        return;
      }

      const { name } = req.body;
      if (!name || name.trim().length === 0) {
        res.status(400).json({ success: false, message: 'Squad name is required' });
        return;
      }

      // Provera vlasništva pre update-a
      const existingSquad = await this.squadService.getSquadById(id);
      if (existingSquad.id === 0) {
        res.status(404).json({ success: false, message: 'Squad not found' });
        return;
      }

      const userId = req.user?.id;
      if (existingSquad.userId !== userId) {
        res.status(403).json({ success: false, message: 'Forbidden' });
        return;
      }

      const squad = await this.squadService.updateSquad(id, name);
      if (squad.id === 0) {
        res.status(404).json({ success: false, message: 'Squad not found or update failed' });
        return;
      }

      res.status(200).json({ success: true, message: 'Squad updated', data: squad });
    } catch (error) {
      console.error('Update squad error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async deleteSquad(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid squad ID' });
        return;
      }

      // Provera vlasništva pre brisanja
      const existingSquad = await this.squadService.getSquadById(id);
      if (existingSquad.id === 0) {
        res.status(404).json({ success: false, message: 'Squad not found' });
        return;
      }

      const userId = req.user?.id;
      if (existingSquad.userId !== userId) {
        res.status(403).json({ success: false, message: 'Forbidden' });
        return;
      }

      const success = await this.squadService.deleteSquad(id);
      if (!success) {
        res.status(404).json({ success: false, message: 'Squad not found or deletion failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'Squad deleted' });
    } catch (error) {
      console.error('Delete squad error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async addMember(req: Request, res: Response): Promise<void> {
    try {
      const squadId = parseInt(req.params.squadId as string);
      const { userCharacterId } = req.body;

      if (isNaN(squadId) || !userCharacterId || isNaN(parseInt(userCharacterId))) {
        res.status(400).json({ success: false, message: 'Invalid squad ID or user character ID' });
        return;
      }

      // Provera vlasništva nad odredom
      const squad = await this.squadService.getSquadById(squadId);
      if (squad.id === 0) {
        res.status(404).json({ success: false, message: 'Squad not found' });
        return;
      }

      const userId = req.user?.id;
      if (squad.userId !== userId) {
        res.status(403).json({ success: false, message: 'Forbidden' });
        return;
      }

      // Provera broja članova (max 4)
      const currentCount = await this.squadMemberService.countMembers(squadId);
      if (currentCount >= 4) {
        res.status(400).json({ success: false, message: 'Squad already has 4 members' });
        return;
      }

      const member = await this.squadMemberService.addMember(squadId, parseInt(userCharacterId));
      if (member.id === 0) {
        res.status(400).json({ success: false, message: 'Failed to add member (maybe already exists)' });
        return;
      }
      res.status(201).json({ success: true, message: 'Member added', data: member });
    } catch (error) {
      console.error('Add member error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async removeMember(req: Request, res: Response): Promise<void> {
    try {
      const memberId = parseInt(req.params.memberId as string);
      if (isNaN(memberId)) {
        res.status(400).json({ success: false, message: 'Invalid member ID' });
        return;
      }

      const success = await this.squadMemberService.removeMember(memberId);
      if (!success) {
        res.status(404).json({ success: false, message: 'Member not found or removal failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'Member removed' });
    } catch (error) {
      console.error('Remove member error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}