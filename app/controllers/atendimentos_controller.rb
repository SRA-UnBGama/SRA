# -*- encoding : utf-8 -*-
class AtendimentosController < ApplicationController
  load_and_authorize_resource

  # GET /atendimentos
  # GET /atendimentos.json
  def index
    @atendimentos = Atendimento.order(:created_at)
  end

  # GET /atendimentos/new
  # GET /atendimentos/new.json
  def new
    place = Place.where(name: cookies[:place_name], active: true)
    unless place.empty?
      @atendimento = Atendimento.new
      @type_places = Type.includes(:places).where("places.id" => place.first.id, "active" => true)
    else
      render :undefined_place
    end
  end

  # GET /atendimentos/1/edit
  def edit
    @atendimento = Atendimento.find(params[:id])
  end

  # POST /atendimentos
  # POST /atendimentos.json
  def create
    @atendimento = Atendimento.new(params[:atendimento])

    respond_to do |format|
      respond_redirect_save(format)
    end
  end

  # PUT /atendimentos/1
  # PUT /atendimentos/1.json
  def update
    @atendimento = Atendimento.find(params[:id])

    respond_to do |format|
      respond_redirect_update(format)
    end
  end

  # DELETE /atendimentos/1
  # DELETE /atendimentos/1.json
  def destroy
    @atendimento = Atendimento.find(params[:id])
    @atendimento.destroy

    respond_to do |format|
      redirect_as_controller(format, atendimentos_path, notice: 'Atendimento deletado com sucesso')
    end
  end

  def undefined_place
  end

  def respond_redirect_save(format)
    if @atendimento.save
      redirect_as_controller(format, new_atendimento_path, notice: 'Atendimento criado com sucesso')
    else
      redirect_as_controller(format, new_atendimento_path, error: '')
      flash[:error] = "Tipo de Atendimento não selecionado"
    end
  end

  def respond_redirect_update(format)
    if @atendimento.update_attributes(params[:atendimento])
      redirect_as_controller(format, atendimentos_path, notice: 'Atendimento alterado com sucesso')
    else
      format.html { render 'edit' }
    end
  end


end
