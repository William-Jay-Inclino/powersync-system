import { Module } from '@nestjs/common';
import { DepartmentService } from './department.service';
import { DepartmentResolver } from './department.resolver';
import { PrismaService } from 'src/__prisma__/prisma.service';

@Module({
  providers: [DepartmentResolver, DepartmentService, PrismaService],
})
export class DepartmentModule {}
