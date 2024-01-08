import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { DistrictService } from './district.service';
import { CreateDistrictDto } from './dto/create-district.dto';
import { UpdateDistrictDto } from './dto/update-district.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('District Level')
@Controller('District')
export class DistrictController {
  constructor(private readonly districtService: DistrictService) {}

  @Post('CreateOrEdit')
  create(@Body() createDistrictDto: CreateDistrictDto) {
    return this.districtService.create(createDistrictDto);
  }

  @Get('GetAllDistrictLevels')
  findAll() {
    return this.districtService.findAll();
  }

  @Get('GetDistrictLevel')
  findOne(@Param('id') id: string) {
    return this.districtService.findOne(+id);
  }

  @Delete('DeleteDistrictLevel')
  remove(@Param('id') id: string) {
    return this.districtService.remove(+id);
  }
}
