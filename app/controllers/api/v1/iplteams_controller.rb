class Api::V1::IplteamsController < ApplicationController
  def index
    iplteams = Iplteam.all
    render json: iplteams, status: 200
  end

  def show
    iplteam = Iplteam.find_by(id: params[:id])
    if iplteam
      render json: iplteam, status:200
    else
      render json: {
        error: "Iplteam not found"
      }
    end
  end

  def create
    iplteam = Iplteam.new(
      title: ipl_params[:name],
      body:ipl_params_params[:cup],
      author:ipl_params[:rank]
    )
    if iplteam.save
      render json: iplteam, status: 200
    else
      render json:{
        error: "Error Creating.."
      }
  end
  end

  def update
    iplteam = Iplteam.find_by(id: params[:id])
    if iplteam
      iplteam.update(name: params[:name], cup: params[:cup], rank: params[:rank])
      render json: "Iplteam Record Updated Successfully"
    else
      render json: {
        error: "Iplteam Not Found"
      }
    end
  end

  def destroy
    iplteam = Iplteam.find_by(id: params[:id])
    if iplteam
      iplteam.destroy
      render json: "Iplteam has deleted"
    end
  end

  private
  def ipl_params
    params.required(:iplteam).permit([
      :name,
      :cup,
      :rank
    ])
  end
end
