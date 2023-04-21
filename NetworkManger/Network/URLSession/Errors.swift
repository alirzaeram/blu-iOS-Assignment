//
//  Errors.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import Foundation

// Enum to represent possible network errors
enum NetworkError: Error, Equatable {
    case invalidURL, invalidResponse, invalidData, invalidEndpoint
    case httpError(Int)
    case badRequest, unauthorized, notFound, forbidden, internalServerError
}
