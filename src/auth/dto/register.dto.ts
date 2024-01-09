import { ApiProperty } from '@nestjs/swagger';

export class RegisterDto {
  @ApiProperty({ required: false })
  role_id?: number;

  @ApiProperty()
  name: string;

  @ApiProperty({ uniqueItems: true })
  email: string;

  @ApiProperty({ uniqueItems: true })
  mobile: string;

  @ApiProperty({ uniqueItems: true })
  password: string;
}

