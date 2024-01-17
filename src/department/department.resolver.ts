import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { DepartmentService } from './department.service';
import { Department } from './entities/department.entity';
import { CreateDepartmentInput } from './dto/create-department.input';
import { UpdateDepartmentInput } from './dto/update-department.input';

@Resolver(() => Department)
export class DepartmentResolver {
  constructor(private readonly departmentService: DepartmentService) {}

  @Query(() => [Department])
  departments() {
    return this.departmentService.findAll();
  }
  
  @Query(() => Department)
  department(@Args('id', { type: () => String }) id: string) {
    return this.departmentService.findOne(id);
  }

  @Mutation(() => Department)
  createDepartment(@Args('input') createDepartmentInput: CreateDepartmentInput) {
    return this.departmentService.create(createDepartmentInput);
  }

  @Mutation(() => Department)
  updateDepartment(
    @Args('id') id: string,
    @Args('input') updateDepartmentInput: UpdateDepartmentInput
  ) {
    return this.departmentService.update(id, updateDepartmentInput);
  }

  @Mutation(() => Boolean)
  removeDepartment(@Args('id', { type: () => String }) id: string) {
    return this.departmentService.remove(id);
  }
}
