jq -r '[.business_id,.type, .review_count, .latitude, .longitude, .stars, .attributes["Wi-Fi"]] | @csv' ./yelp_academic_dataset_business.json
