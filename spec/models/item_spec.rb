require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    
    context '商品出品がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "item_state_idが空だと登録できない" do
        @item.item_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state is not a number")
      end
      it "delivery_cost_idが空だと登録できない" do
        @item.delivery_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost is not a number")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "ship_date_idが空だと登録できない" do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date is not a number")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    end
  end

end
