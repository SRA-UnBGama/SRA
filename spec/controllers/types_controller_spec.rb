require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TypesController do

  # This should return the minimal set of attributes required to create a valid
  # Type. As you add validations to Type, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :name => "Alessandro"  } }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all types as @types" do
      type = Type.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:types)).to eq([])
    end
  end


  describe "GET new" do
    it "assigns a new type as @type" do
      get :new, {}, valid_session
      expect(assigns(:type)).to be_a_new(Type)
    end
  end

  describe "GET edit" do
    it "assigns the requested type as @type" do
      type = Type.create! valid_attributes
      get :edit, {:id => type.to_param}, valid_session
      expect(assigns(:type)).to eq(type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Type" do
        expect {
          post :create, {:type => valid_attributes}, valid_session
        }.to change(Type, :count).by(0)
      end

      it "assigns a newly created type as @type" do
        post :create, {:type => valid_attributes}, valid_session
        expect(assigns(:type)).to be_a(Type)
        end

      it "redirects to the homepage" do
        post :create, {:type => valid_attributes}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved type as @type" do
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        post :create, {:type => {  }}, valid_session
        expect(assigns(:type)).to be_a_new(Type)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        post :create, {:type => {  }}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      it "assigns the requested type as @type" do
        type = Type.create! valid_attributes
        put :update, {:id => type.to_param, :type => valid_attributes}, valid_session
        expect(assigns(:type)).to eq(type)
      end

      it "redirects to the homepage" do
        type = Type.create! valid_attributes
        put :update, {:id => type.to_param, :type => valid_attributes}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns the type as @type" do
        type = Type.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        put :update, {:id => type.to_param, :type => {  }}, valid_session
        expect(assigns(:type)).to eq(type)
      end

      it "re-renders the 'edit' template" do
        type = Type.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        put :update, {:id => type.to_param, :type => {  }}, valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested type" do
      type = Type.create! valid_attributes
      expect {
        delete :destroy, {:id => type.to_param}, valid_session
      }.to change(Type, :count).by(0)
    end

    it "redirects to the homepage" do
      type = Type.create! valid_attributes
      delete :destroy, {:id => type.to_param}, valid_session
      expect(response).to redirect_to(root_path)
    end
  end

end
