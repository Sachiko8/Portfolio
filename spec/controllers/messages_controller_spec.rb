require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

    describe 'get#new' do
      context "お問い合わせページが正しく表示される" do
        before do
          get :new
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end

        it ':newテンプレートを表示すること' do
        	expect(response).to render_template :new
        end

      end
    end
end
