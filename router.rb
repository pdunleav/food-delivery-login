class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.manager?
          puts "[MANAGER] - welcome #{@employee.username}"
          print_manager_menu
          action = user_action
          p action
          route_manager_action(action)
        else
          puts "[DELIVERY GUY] - welcome #{@employee.username}"
          # TODO: Implement delivery guy menu and actions...

          # print_delivery_guy_menu
          # action = user_action
          # route_delivery_guy_action(action)
        end
      end
    end
  end

  private

  def user_action
    print "> "
    action = gets.chomp.to_i
    print `clear`
    return action
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @employee = nil
    when 6
      @employee = nil
      @running = false
    else
      puts "Invalid action, pick again!"
    end
  end

  def print_manager_menu
    puts ""
    puts "What would you like to do?"
    puts "1 - list meals"
    puts "2 - add a new meal"
    puts "3 - list customers"
    puts "4 - add a new customer"
    puts "5 - log out"
    puts "6 - stop"
  end
end
