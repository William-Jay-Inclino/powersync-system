import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { CreateDepartmentInput } from './dto/create-department.input';
import { UpdateDepartmentInput } from './dto/update-department.input';
import { Department } from './entities/department.entity';
import { PrismaService } from '../__prisma__/prisma.service';
import { Logger } from '@nestjs/common';

@Injectable()
export class DepartmentService {

    private readonly logger = new Logger(DepartmentService.name);

    constructor(private readonly prisma: PrismaService) {}

    async create(createDepartmentInput: CreateDepartmentInput): Promise<Department> {

        try {
            
            const item = await this.prisma.department.create({
                data: { ...createDepartmentInput }
            })

            return await this.findOne(item.id)

        } catch (error) {
            this.logger.error(`Failed to create department: ${error.message}`);
            throw new InternalServerErrorException('Failed to create department');
        }
        
    }

    async findAll(): Promise<Department[]> {

        return await this.prisma.department.findMany({
            where: {
                is_deleted: false
            },
            include: {
                employees: true
            }
        })

    }

    async findOne(id: string): Promise<Department> {
        
        return await this.prisma.department.findUniqueOrThrow({
            where: {id, is_deleted: false},
            include: {
                employees: true
            }
        })

    }

    async update(id: string, updateDepartmentInput: UpdateDepartmentInput): Promise<Department> {
        
        const item = await this.prisma.department.update( {
            where: { id },
            data: { ...updateDepartmentInput }
        } )

        return await this.findOne(item.id)

    }

    async remove(id: string): Promise<boolean> {
        
        await this.findOne(id)
        
        await this.prisma.department.update({
            where: { id },
            data: {
                is_deleted: true
            }
        })

        return true

    }
}
