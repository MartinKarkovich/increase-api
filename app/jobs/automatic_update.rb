class AutomaticUpdate < ApplicationJob
  def perform
    puts 'Initiating automatic update'
    ProcessAllTransactions.run
    puts 'Automatic update complete'
  end
end