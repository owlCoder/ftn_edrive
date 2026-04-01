import { ElementType } from "../../enums/ElementType";
import { WeaponType } from "../../enums/WeaponType";

export class CharacterDto {
  constructor(
    public id: number = 0,
    public name: string = '',
    public element: ElementType = 'Pyro',
    public weaponType: WeaponType = 'Sword',
    public rarity: 4 | 5 = 4,
    public region: string = '',
    public description: string = '',
    public image: string = '',
    public createdAt: Date = new Date(),
    public updatedAt: Date = new Date()
  ) {}
}