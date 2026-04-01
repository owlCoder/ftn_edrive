import { Request, Response, Router } from "express";
import { IUserService } from "../../Domain/services/users/IUserService";
import { UserDto } from "../../Domain/DTOs/users/UserDto";
import { authenticate } from "../../Middlewares/authentification/AuthMiddleware";
import { authorize } from "../../Middlewares/authorization/AuthorizeMiddleware";

export class UserController {
  private router: Router;
  private userService: IUserService;

  constructor(userService: IUserService) {
    this.router = Router();
    this.userService = userService;
    this.initializeRoutes();
  }

  private initializeRoutes(): void {
    this.router.get("/users", authenticate, authorize("admin"), this.getAllUsers.bind(this));
    this.router.get("/users/:id", authenticate, this.getUserById.bind(this));
    this.router.put("/users/:id/role", authenticate, authorize("admin"), this.updateUserRole.bind(this));
    this.router.delete("/users/:id", authenticate, authorize("admin"), this.deleteUser.bind(this));
  }

  private async getAllUsers(req: Request, res: Response): Promise<void> {
    try {
      const users = await this.userService.getAllUsers();
      res.status(200).json({ success: true, data: users });
    } catch (error) {
      console.error('Get all users error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async getUserById(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid user ID' });
        return;
      }

      const user = await this.userService.getUserById(id);
      if (user.id === 0) {
        res.status(404).json({ success: false, message: 'User not found' });
        return;
      }
      res.status(200).json({ success: true, data: user });
    } catch (error) {
      console.error('Get user by id error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async updateUserRole(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      const { role } = req.body;

      if (isNaN(id) || !role || !['player', 'admin'].includes(role)) {
        res.status(400).json({ success: false, message: 'Invalid user ID or role' });
        return;
      }

      const updatedUser = await this.userService.updateUserRole(id, role);
      if (updatedUser.id === 0) {
        res.status(404).json({ success: false, message: 'User not found' });
        return;
      }
      res.status(200).json({ success: true, message: 'Role updated', data: updatedUser });
    } catch (error) {
      console.error('Update user role error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  private async deleteUser(req: Request, res: Response): Promise<void> {
    try {
      const id = parseInt(req.params.id as string);
      if (isNaN(id)) {
        res.status(400).json({ success: false, message: 'Invalid user ID' });
        return;
      }

      const success = await this.userService.deleteUser(id);
      if (!success) {
        res.status(404).json({ success: false, message: 'User not found or deletion failed' });
        return;
      }
      res.status(200).json({ success: true, message: 'User deleted successfully' });
    } catch (error) {
      console.error('Delete user error:', error);
      res.status(500).json({ success: false, message: 'Internal server error' });
    }
  }

  public getRouter(): Router {
    return this.router;
  }
}