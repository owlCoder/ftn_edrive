export class SquadMemberDto {
  constructor(
    public id: number = 0,
    public squadId: number = 0,
    public userCharacterId: number = 0,
    public createdAt: Date = new Date()
  ) {}
}