/**
*  Plot
*  Copyright (c) John Sundell 2021
*  MIT license, see LICENSE file for details
*/

import Foundation

/// Enum describing various podcast types supported by Apple Podcasts.
public enum PodcastType: String, Codable, Sendable {
  case episodic
  case serial
}
