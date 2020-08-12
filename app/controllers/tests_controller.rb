class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_url, notice: '作成しました'
    else
      render 'tests/new'
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      redirect_to tests_url, notice: '編集しました'
    else
      render 'tests/edit'
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_url
  end

  private

  def test_params
    params.require(:test).permit(:name)
  end
end
