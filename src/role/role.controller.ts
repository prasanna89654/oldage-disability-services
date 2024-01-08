import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { RoleService } from './role.service';
import { CreateRoleDto } from './dto/create-role.dto';
import { UpdateRoleDto } from './dto/update-role.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('Role')
@Controller('Role')
export class RoleController {
  constructor(private readonly roleService: RoleService) {}

  @Post('CreateOrEdit')
  create(@Body() createRoleDto: CreateRoleDto) {
    return this.roleService.create(createRoleDto);
  }

  @Get('GetAllRoles')
  findAll() {
    return this.roleService.findAll();
  }

  @Get('GetRole')
  findOne(@Param('id') id: string) {
    return this.roleService.findOne(+id);
  }

  @Delete('DeleteRole')
  remove(@Param('id') id: string) {
    return this.roleService.remove(+id);
  }
}
