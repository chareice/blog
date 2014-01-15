FactoryGirl.define do
    factory :post do
        title 'This is the title for the post'
        content 'This is the content for the post'

        factory :post_with_tag do
            after(:create) do |post|
                %w{心情 天气 日记}.each do |tag_name|
                    post.tags << create(:tag, name: tag_name)
                end
            end
        end
    end
end