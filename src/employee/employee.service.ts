import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { CreateEmployeeInput } from './dto/create-employee.input';
import { UpdateEmployeeInput } from './dto/update-employee.input';
import { Employee } from './entities/employee.entity';
import { PrismaService } from '../__prisma__/prisma.service';
import { Logger } from '@nestjs/common';

@Injectable()
export class EmployeeService {

    private readonly logger = new Logger(EmployeeService.name);

    constructor(private readonly prisma: PrismaService) {}

    async create(createEmployeeInput: CreateEmployeeInput): Promise<Employee> {

        try {
            
            const item = await this.prisma.employee.create({
                data: { ...createEmployeeInput }
            })

            return await this.findOne(item.id)

        } catch (error) {
            this.logger.error(`Failed to create employee: ${error.message}`);
            throw new InternalServerErrorException('Failed to create employee');
        }
        
    }

    async findAll(): Promise<Employee[]> {

        return await this.prisma.employee.findMany({
            where: {
                is_deleted: false
            },
            include: {
                department: true
            }
        })

    }

    async findOne(id: string): Promise<Employee> {
        
        return await this.prisma.employee.findUniqueOrThrow({
            where: {id, is_deleted: false},
            include: {
                department: true
            }
        })

    }

    async update(id: string, updateEmployeeInput: UpdateEmployeeInput): Promise<Employee> {
        
        const item = await this.prisma.employee.update( {
            where: { id },
            data: { ...updateEmployeeInput }
        } )

        return await this.findOne(item.id)

    }

    async remove(id: string): Promise<boolean> {
        
        await this.findOne(id)
        
        await this.prisma.employee.update({
            where: { id },
            data: {
                is_deleted: true
            }
        })

        return true

    }
}
