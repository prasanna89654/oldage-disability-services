import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { LocalModule } from './local/local.module';
import { StateModule } from './state/state.module';
import { DistrictModule } from './district/district.module';
import { RoleModule } from './role/role.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [LocalModule, StateModule, DistrictModule, RoleModule, PrismaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
