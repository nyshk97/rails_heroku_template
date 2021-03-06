class TestsController < ApplicationController
  before_action :find_test, only: %i[edit update destroy]
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_url, notice: 'タスクを追加しました'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to tests_url, notice: 'タスクを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'タスクを削除しました'
  end

  private

  def test_params
    params.require(:test).permit(:name)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
