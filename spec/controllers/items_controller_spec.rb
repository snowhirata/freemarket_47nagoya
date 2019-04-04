require "rails_helper"

describe ItemsController, type: :controller do
  describe 'GET #index' do
    # render_views
    let(:user) { create(:user) }
    # let(:category) {create(:category)}

    # before do
    #   user.confirm
    #   sign_in user
    # end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    it "assgins the requested item to @item" do
      item = create(:item, seller_id: user.id, buyer_id: user.id, category_id: category.id)
      get :index
      expect(assigns(:items)).to eq (@items)
    end

    it "populates an array of items ordered by updated_at DESC" do
      items = create_list(:item, 4, seller_id: user.id, buyer_id: user.id, category_id: category.id)
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.updated_at <=> a.updated_at } )
    end
  end
end
