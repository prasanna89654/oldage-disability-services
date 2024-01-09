import { Injectable } from '@nestjs/common';
import { LoginDto } from './dto/login.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { LoginResponse } from './dto/login.response';
import { RegisterDto } from './dto/register.dto';
import { User } from '@prisma/client';

@Injectable()
export class AuthService {
  constructor(
    private prismaService: PrismaService,
    private jwtService: JwtService,
  ) {}
  async login(loginDto: LoginDto): Promise<LoginResponse> {
    const user = await this.prismaService.user.findFirst({
      where: {
        OR: [
          {
            email: loginDto.username,
          },
          {
            mobile: loginDto.username,
          },
        ],
      },
      include: {
        role: true,
      },
    });

    if (!user) {
      throw new Error('Invalid username or password');
    }

    const isPasswordValid = await bcrypt.compare(
      loginDto.password,
      user.password,
    );

    if (!isPasswordValid) {
      throw new Error('Invalid username or password');
    }

    const generatedToken = this.jwtService.sign({
      userId: user.id,
      role: user.role.name,
    });

    const loginResponse: LoginResponse = {
      user_id: user.id,
      access_token: generatedToken,
      role: user.role.name,
    };

    return loginResponse;
  }

  async register(registerDto: RegisterDto): Promise<User> {
    const hashedPassword = await bcrypt.hash(registerDto.password, 10);

    const user = await this.prismaService.user.create({
      data: {
        name: registerDto.name,
        email: registerDto.email,
        mobile: registerDto.mobile,
        password: hashedPassword,
        role: {
          connect: {
            id: registerDto.role_id,
          },
        },
      },
    });

    return user;
  }
}
