import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { LocalService } from './local.service';
import { CreateLocalDto } from './dto/create-local.dto';
import { UpdateLocalDto } from './dto/update-local.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('Local Level')
@Controller('Local')
export class LocalController {
  constructor(private readonly localService: LocalService) {}

  @Post('CreateOrEdit')
  create(@Body() createLocalDto: CreateLocalDto) {
    return this.localService.create(createLocalDto);
  }

  @Get('GetAllLocalLevels')
  findAll() {
    return this.localService.findAll();
  }

  @Get('GetLocalLevel')
  findOne(@Param('id') id: string) {
    return this.localService.findOne(+id);
  }

  @Delete('DeleteLocalLevel')
  remove(@Param('id') id: string) {
    return this.localService.remove(+id);
  }
}
