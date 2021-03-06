# -*- encoding : utf-8 -*-
class TypesController < ApplicationController

  load_and_authorize_resource except: [:type_by_place]

  def index
    @types = Type.ordened

  end

  def new
    @type = Type.new
  end


  def edit
    @type = Type.find(params[:id])
  end


  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      respond_redirect_save(format)
    end
  end


  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      respond_redirect_update(format)
    end
  end


  def destroy
    @type = Type.find(params[:id])
    @type.set_status

    respond_to do |format|
      redirect_as_controller(format, types_path, notice: 'Tipo de Atendimento %s com sucesso.' % (@type.active ? "habilitado" : "desabilitado"))
    end
  end

  def type_by_place
    @type = Place.find(params[:id]).types.where('active is true').order('name ASC')

    respond_to do |format|
      respond_redirect_jsformat(format)
    end
  end

  def respond_redirect_update(format)
    if @type.update_attributes(params[:type])
      redirect_as_controller(format, types_path, notice: 'Tipo de Atendimento alterado com sucesso.')
    else
      format.html { render 'edit' }
    end
  end

  def respond_redirect_save(format)
    if @type.save
      redirect_as_controller(format, types_path, notice: 'Tipo de Atendimento criado com sucesso.')
    else
      format.html { render  'new' }
    end
  end

  def respond_redirect_jsformat(format)
    format.js { render json: @type }
  end
end
