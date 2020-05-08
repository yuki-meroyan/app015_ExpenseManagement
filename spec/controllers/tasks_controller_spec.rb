# describe MessagesController do
#   let(:group) { create(:group) }

#   describe 'GET #index' do
#     it "renders the :index template" do
#       ~~~
#     end

#     it "assigns the requested messsage to @message" do
#       ~~~
#     end

#     it "assigns the requested task_group to @group" do
#       get :index, group_id: group
#       expect(assigns(:group)).to eq group
#     end
#   end
# end

# # indexアクション
# describe 'GET #index' do
#   it "正しいビューに変遷する" do
#   end

#   it "@messageが期待される値を持つ" do
#   end

#   it "@groupが期待される値を持つ" do
#     group = create(:group)
#     get :index, chat_group_id: chat_group
#   end
# end

# # createアクション
# describe 'Post #create' do
#   context "@messageが保存できた時" do

#     it "データベースに値が保存される" do
#     end

#     it "正しいビューに変遷する" do
#     end

#   end

#   context "@messageが保存できなかった時" do

#     it "データベースに値が保存されない" do
#     end

#     it "正しいビューに変遷する" do
#     end

#   end

#  end