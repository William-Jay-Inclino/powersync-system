import { Module } from '@nestjs/common';
import { EmployeeService } from './employee.service';
import { EmployeeResolver } from './employee.resolver';
import { PrismaService } from 'src/__prisma__/prisma.service';

@Module({
  providers: [EmployeeResolver, EmployeeService, PrismaService],
})
export class EmployeeModule {}
