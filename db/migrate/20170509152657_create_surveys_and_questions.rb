class CreateSurveysAndQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |d|
      d.column(:name, :string)

      d.timestamps()
    end

    create_table(:questions) do |d|
      d.column(:description, :string)
      d.column(:survey_id, :integer)

      d.timestamps()
    end
  end
end
