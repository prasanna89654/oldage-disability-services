import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';


export class CreateRoleDto {
  @ApiProperty({ required: false })
  id?: number;

  @ApiProperty()
  @IsNotEmpty()
  @IsString()
  name: string;
}
