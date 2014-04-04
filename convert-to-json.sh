jq -r '[.business_id,.type, .review_count, .latitude, .longitude, .stars, .attributes["Wi-Fi"], .attributes["Alcohol"]] | @csv' ./yelp_academic_dataset_business.json > business.csv
jq -r '[.review_id, .business_id, .user_id, .type, .stars, .date] | @csv' yelp_academic_dataset_review.json > review.csv
