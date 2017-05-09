class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table(:answers) do |d|
      d.column(:option, :string)
      d.column(:question_id, :integer)

      d.timestamps()
    end
  end
end
