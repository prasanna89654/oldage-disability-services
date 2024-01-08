import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { StateService } from './state.service';
import { CreateStateDto } from './dto/create-state.dto';
import { UpdateStateDto } from './dto/update-state.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('State Level')
@Controller('State')
export class StateController {
  constructor(private readonly stateService: StateService) {}

  @Post('CreateOrEdit')
  create(@Body() createStateDto: CreateStateDto) {
    return this.stateService.create(createStateDto);
  }

  @Get('GetAllStateLevels')
  findAll() {
    return this.stateService.findAll();
  }

  @Get('GetStateLevel')
  findOne(@Param('id') id: string) {
    return this.stateService.findOne(+id);
  }

  @Delete('DeleteStateLevel')
  remove(@Param('id') id: string) {
    return this.stateService.remove(+id);
  }
}
