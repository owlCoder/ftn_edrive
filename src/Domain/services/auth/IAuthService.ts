import { UserAuthDataDto } from "../../DTOs/auth/UserAuthDataDto";

export interface IAuthService {
  register(username: string, fullName: string, email: string, password: string, profilePicture?: string): Promise<UserAuthDataDto>;
  login(usernameOrEmail: string, password: string): Promise<UserAuthDataDto>;
  logout(userId: number, ipAddress?: string): Promise<boolean>;
}