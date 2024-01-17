import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { EmployeeService } from './employee.service';
import { Employee } from './entities/employee.entity';
import { CreateEmployeeInput } from './dto/create-employee.input';
import { UpdateEmployeeInput } from './dto/update-employee.input';

@Resolver(() => Employee)
export class EmployeeResolver {
  constructor(private readonly employeeService: EmployeeService) {}

  @Query(() => [Employee])
  employees() {
    return this.employeeService.findAll();
  }
  
  @Query(() => Employee)
  employee(@Args('id', { type: () => String }) id: string) {
    return this.employeeService.findOne(id);
  }

  @Mutation(() => Employee)
  createEmployee(@Args('input') createEmployeeInput: CreateEmployeeInput) {
    return this.employeeService.create(createEmployeeInput);
  }

  @Mutation(() => Employee)
  updateEmployee(
    @Args('id') id: string,
    @Args('input') updateEmployeeInput: UpdateEmployeeInput
  ) {
    return this.employeeService.update(id, updateEmployeeInput);
  }

  @Mutation(() => Boolean)
  removeEmployee(@Args('id', { type: () => String }) id: string) {
    return this.employeeService.remove(id);
  }
}
