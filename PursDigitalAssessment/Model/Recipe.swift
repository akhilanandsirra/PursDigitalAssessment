//
//  Recipe.swift
//  PursDigitalAssessment
//
//  Created by Akhil Anand Sirra on 16/06/23.
//

import Foundation

// MARK: - Recipe
struct Recipe: Codable {
    let calories, carbs, description: String
    let difficulty: Int
    let fats, headline, id: String
    let image: String
    let name, proteins: String
    let thumb: String
    let time: String
    let country: String?
}

typealias Recipes = [Recipe]

extension Recipe {
    enum CodingKeys: String, CodingKey {
        case calories, description, difficulty, fats, headline, id, image, name, proteins, thumb, time, country
        case carbs = "carbos"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        calories = try container.decode(String.self, forKey: .calories)
        carbs = try container.decode(String.self, forKey: .carbs)
        description = try container.decode(String.self, forKey: .description)
        difficulty = try container.decode(Int.self, forKey: .difficulty)
        fats = try container.decode(String.self, forKey: .fats)
        headline = try container.decode(String.self, forKey: .headline)
        id = try container.decode(String.self, forKey: .id)
        image = try container.decode(String.self, forKey: .image)
        name = try container.decode(String.self, forKey: .name)
        proteins = try container.decode(String.self, forKey: .proteins)
        thumb = try container.decode(String.self, forKey: .thumb)
        time = try container.decode(String.self, forKey: .time)
        country = try container.decodeIfPresent(String.self, forKey: .country)    }
}

extension Recipe {
    static let sampleData: Recipes = [
        Recipe(calories: "516 kcal", carbs: "47 g", description: "There’s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!", difficulty: 0, fats: "8 g", headline: "with Sweet Potato Wedges and Minted Snap Peas", id: "533143aaff604d567f8b4571", image: "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143aaff604d567f8b4571.jpg", name: "Crispy Fish Goujons ", proteins: "43 g", thumb: "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143aaff604d567f8b4571.jpg", time: "PT35M", country: nil)
    ]
    
    static let sampleJSON = """
[
  {
      "calories": "516 kcal",
      "carbos": "47 g",
      "description": "There’s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!",
      "difficulty": 0,
      "fats": "8 g",
      "headline": "with Sweet Potato Wedges and Minted Snap Peas",
      "id": "533143aaff604d567f8b4571",
      "image": "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
      "name": "Crispy Fish Goujons",
      "proteins": "43 g",
      "thumb": "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
      "time": "PT35M"
    },
    {
      "calories": "397 kcal",
      "carbos": "26 g",
      "description": "Close your eyes, open up your Ras El Hanout and inhale deeply. You are no longer standing in your kitchen. Around you are the sounds of a bustling market. Robed men sell ornate carpets and a camel nibbles affectionately at your ear. OK, we’re pretty sure Paul McKenna’s job is safe for now, but get cooking this recipe and take dinnertime on a magic carpet ride to Casablanca! Our tip for this recipe is to take your meat out of the fridge at least 30 minutes before dinner which will allow you to cook it more evenly.",
      "difficulty": 0,
      "fats": "5 g",
      "headline": "with Spinach and Lemon Couscous",
      "id": "53314247ff604d44808b4569",
      "image": "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/53314247ff604d44808b4569.jpg",
      "name": "Moroccan Skirt Steak",
      "proteins": "31 g",
      "thumb": "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/53314247ff604d44808b4569.jpg",
      "time": "PT30M"
    },
    {
      "calories": "458 kcal",
      "carbos": "29 g",
      "description": "World-renowned people generally all have one thing in common: a legacy. For Henry Ford it was the motorcar, for Thomas Edison it was the lightbulb. For our intern Simon, it was this lip-smackingly awesome Sea Bream. Taking the warm crunchiness of potatoes against the fresh southern Asian flavours of fish with coriander, ginger and lime, it’s the perfect dish for transporting your tastebuds. Don’t let the smell of the fish sauce throw you - add it gradually to your sauce for a really authentic Asian spin!",
      "difficulty": 1,
      "fats": "6 g",
      "headline": "with Tomato Concasse and Crispy Potatoes",
      "id": "53314cc6ff604d567f8b4567",
      "image": "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/53314cc6ff604d567f8b4567.jpg",
      "name": "Vietnamese Sea Bream",
      "proteins": "43 g",
      "thumb": "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/53314cc6ff604d567f8b4567.jpg",
      "time": "PT40M"
    },
  {
    "calories": "717 kcal",
    "carbos": "44 g",
    "description": "Nostalgia is a powerful thing. For some it's triggered by the smell of freshly cut grass, for others by the sound of a love song from their heady teenage years. For Head Chef Patrick it's all about Swiss Roll. A firm dinnertime favourite from his primary school years, we still see him go all misty-eyed at the mere mention of it. We're pretty sure that was the inspiration behind this little number. Tonight, prepare to create a little nostalgia that the little 'uns will remember for years!",
    "difficulty": 2,
    "fats": "10 g",
    "headline": "with Roasted Rocket Potatoes",
    "id": "533143bfff604d44808b456a",
    "image": "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143bfff604d44808b456a.jpg",
    "name": "Mozzarella and Pesto Roulades",
    "proteins": "67 g",
    "thumb": "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143bfff604d44808b456a.jpg",
    "time": "PT35M"
  }
]
"""
    
}



