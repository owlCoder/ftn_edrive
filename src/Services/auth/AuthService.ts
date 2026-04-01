import { UserAuthDataDto } from "../../Domain/DTOs/auth/UserAuthDataDto";
import { User } from "../../Domain/models/User";
import { IUserRepository } from "../../Domain/repositories/users/IUserRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";
import { IAuthService } from "../../Domain/services/auth/IAuthService";
import bcrypt from "bcryptjs";

export class AuthService implements IAuthService {
  private readonly saltRounds: number = parseInt(process.env.SALT_ROUNDS || "10", 10);

  public constructor(
    private userRepository: IUserRepository,
    private auditService: IAuditService
  ) {}

  async register(
    username: string,
    fullName: string,
    email: string,
    password: string,
    profilePicture: string = ''
  ): Promise<UserAuthDataDto> {
    // Provera da li korisnik već postoji
    const existingByUsername = await this.userRepository.getByUsername(username);
    if (existingByUsername.id !== 0) {
      return new UserAuthDataDto(); // Korisničko ime zauzeto
    }
    const existingByEmail = await this.userRepository.getByEmail(email);
    if (existingByEmail.id !== 0) {
      return new UserAuthDataDto(); // Email zauzet
    }

    const hashedPassword = await bcrypt.hash(password, this.saltRounds);
    const newUser = await this.userRepository.create(
      new User(0, username, fullName, email, hashedPassword, 'player', profilePicture)
    );

    if (newUser.id !== 0) {
      // Beležimo registraciju u audit
      await this.auditService.create({
        userId: newUser.id,
        action: 'REGISTER',
        details: `User ${username} registered`,
        ipAddress: ''
      });
      return new UserAuthDataDto(newUser.id, newUser.username, newUser.email, newUser.role);
    }
    return new UserAuthDataDto(); // Greška pri kreiranju
  }

  async login(usernameOrEmail: string, password: string): Promise<UserAuthDataDto> {
    // Pokušaj prvo po korisničkom imenu
    let user = await this.userRepository.getByUsername(usernameOrEmail);
    if (user.id === 0) {
      // Ako nije pronađeno, pokušaj po emailu
      user = await this.userRepository.getByEmail(usernameOrEmail);
    }

    if (user.id !== 0 && await bcrypt.compare(password, user.passwordHash)) {
      // Beležimo prijavu u audit
      await this.auditService.create({
        userId: user.id,
        action: 'LOGIN',
        details: `User ${user.username} logged in`,
        ipAddress: ''
      });
      return new UserAuthDataDto(user.id, user.username, user.email, user.role);
    }

    return new UserAuthDataDto(); // Neispravni kredencijali
  }

  async logout(userId: number, ipAddress: string = ''): Promise<boolean> {
    // Beležimo odjavu u audit
    const audit = await this.auditService.create({
      userId,
      action: 'LOGOUT',
      details: `User logged out`,
      ipAddress
    });
    return audit.id !== 0;
  }
}