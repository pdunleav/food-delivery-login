require_relative 'router'
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/sessions_controller"

meals_csv = "data/meals.csv"
meal_repo = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repo)

customers_csv = "data/customers.csv"
customer_repo = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repo)

employees_csv = "data/employees.csv"
employee_repo = EmployeeRepository.new(employees_csv)
# employees_controller = EmployeesController.new(employee_repo). TODO!!!

sessions_controller = SessionsController.new(employee_repo)


router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
