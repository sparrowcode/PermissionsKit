// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public enum SPStatusBar {
    case dark
    case light
}

public enum SPSystemIconType {
    case share
    case close
    case favorite
    case favorite_fill
}

public enum SPSocialNetwork {
    case whatsapp
    case telegram
    case vk
    case facebook
    case viber
}

public enum SPOauthState {
    case succsess
    case unvalidLogin
    case invalidLogin
    case unvalidPassword
    case invalidPassword
    case needTwoFactor
    case error
}

public enum SPSeparatorInsetStyle {
    case beforeImage
    case all
    case none
    case auto
}

public enum SPNavigationTitleStyle {
    case large
    case small
    case stork
}

public enum SPSystemApp {
    case photos
    case setting
}

public enum SPSelectionType {
    case select
    case unselect
}
