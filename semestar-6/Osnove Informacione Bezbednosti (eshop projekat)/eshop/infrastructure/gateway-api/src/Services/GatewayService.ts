import axios, { AxiosInstance } from "axios";
import { IGatewayService } from "../Domain/services/IGatewayService";
import { LoginUserDTO } from "../Domain/DTOs/LoginUserDTO";
import { RegistrationUserDTO } from "../Domain/DTOs/RegistrationUserDTO";
import { AuthResponseType } from "../Domain/types/AuthResponse";
import { UserDTO } from "../Domain/DTOs/UserDTO";
import { PlantDTO } from "../Domain/DTOs/PlantDTO";

export class GatewayService implements IGatewayService {
  private readonly authClient: AxiosInstance;
  private readonly userClient: AxiosInstance;
  private readonly plantClient: AxiosInstance;

  constructor() {
    const authBaseURL = process.env.AUTH_SERVICE_API;
    const userBaseURL = process.env.USER_SERVICE_API;
    const plantBaseURL = process.env.PLANT_SERVICE_API;

    this.authClient = axios.create({
      baseURL: authBaseURL,
      headers: { "Content-Type": "application/json" },
      timeout: 5000,
    });

    this.userClient = axios.create({
      baseURL: userBaseURL,
      headers: { "Content-Type": "application/json" },
      timeout: 5000,
    });

    this.plantClient = axios.create({
      baseURL: plantBaseURL,
      headers: { "Content-Type": "application/json" },
      timeout: 5000,
    });
  }

  // Auth microservice
  async login(data: LoginUserDTO): Promise<AuthResponseType> {
    try {
      const response = await this.authClient.post<AuthResponseType>("/auth/login", data);
      return response.data;
    } catch {
      return { authenificated: false };
    }
  }

  async register(data: RegistrationUserDTO): Promise<AuthResponseType> {
    try {
      const response = await this.authClient.post<AuthResponseType>("/auth/register", data);
      return response.data;
    } catch {
      return { authenificated: false };
    }
  }

  // User microservice
  async getAllUsers(): Promise<UserDTO[]> {
    const response = await this.userClient.get<UserDTO[]>("/users");
    return response.data;
  }

  async getUserById(id: number): Promise<UserDTO> {
    const response = await this.userClient.get<UserDTO>(`/users/${id}`);
    return response.data;
  }

  // Plant microservice
  async getAllPlants(): Promise<PlantDTO[]> {
    const response = await this.plantClient.get<PlantDTO[]>("/plants");
    return response.data;
  }

  async getPlantById(id: number): Promise<PlantDTO> {
    const response = await this.plantClient.get<PlantDTO>(`/plants/${id}`);
    return response.data;
  }

  async createPlant(plant: PlantDTO): Promise<PlantDTO> {
    const response = await this.plantClient.post<PlantDTO>("/plants", plant);
    return response.data;
  }

  async updatePlant(id: number, plant: PlantDTO): Promise<PlantDTO> {
    const response = await this.plantClient.put<PlantDTO>(`/plants/${id}`, plant);
    return response.data;
  }

  async deletePlant(id: number): Promise<boolean> {
    const response = await this.plantClient.delete<{ success: boolean }>(`/plants/${id}`);
    return response.data.success;
  }
}
