//
//  modelJSON.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/27/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import Foundation
enum JSONError: Error{
    case decodingError(Error)
}

//struct Weather: Codable{
//    let list: [WeatherInfo]
//}

struct WeatherInfo: Codable{
    let name: String
    let main: MainWrapper
    
    static func getWeather(from data: Data) throws -> [WeatherInfo]{
        do{
            let forcast = try JSONDecoder().decode([WeatherInfo].self, from: data)
            return forcast
        } catch { throw JSONError.decodingError(error)}
    }
}

struct MainWrapper: Codable{
    let temp: Double
}

struct WeatherWrapper: Codable {
    let id: Int
    let main: String
    let description: String
}

//------------------------------------------------------------------------------------------------
struct Color: Codable{
    let name: NameWrapper
    let hex: HexWrapper
    let rgb: ColorWrapper
    
    
    static func getColor(from data: Data) throws -> [Color]{
        do{
            let scheme = try JSONDecoder().decode([Color].self, from: data)
            return scheme
        } catch { throw JSONError.decodingError(error)}
    }
}

struct ColorWrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}
struct HexWrapper: Codable {
    let clean: String
}
struct NameWrapper: Codable {
    let value: String
}
//-----------------------------------------------------------------------------------------------------
struct People: Codable{
    let name: PeopleNameWrapper
    let dob: AgeWrapper
    let location: LocationWrapper
    
    static func getPeople(from data: Data) throws -> [People]{
        do{
            let human = try JSONDecoder().decode([People].self, from: data)
            return human
        } catch { throw JSONError.decodingError(error)}
    }
}

struct PeopleNameWrapper: Codable {
    let title: String
    let first: String
    let last: String
}
struct LocationWrapper: Codable {
    let street: String
    let city: String
}
struct AgeWrapper: Codable {
    let date: String
    let age: Int
}
