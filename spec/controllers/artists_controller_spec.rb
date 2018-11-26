require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do

    describe 'get#index' do
      context "アーティスト一覧ページが正しく表示される" do
        before do
          get :index
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end

        it ':indexテンプレートを表示すること' do
        	expect(response).to render_template :index
        end

      end
    end

    describe 'get#show' do
      context "お問い合わせページが正しく表示される" do
        before do
          get :show
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end

        it ':newテンプレートを表示すること' do
          expect(response).to render_template :show
        end

      end
    end

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

    describe 'get#edit' do
      context "お問い合わせページが正しく表示される" do
        before do
          get :edit
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end

        it ':newテンプレートを表示すること' do
          expect(response).to render_template :edit
        end

      end
    end

    describe 'post#create' do
      context "お問い合わせページが正しく表示される" do
        before do
          post :create
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'patch#update' do
      context "お問い合わせページが正しく表示される" do
        before do
          patch :update
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'delete#destroy' do
      context "お問い合わせページが正しく表示される" do
        before do
          delete :destroy
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end



end
