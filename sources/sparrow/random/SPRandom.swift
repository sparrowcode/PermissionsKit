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

public extension String {
    public static func random(count: Int) -> String {
        let strings = [
            "В доме кардинала от меня не было тайн; не раз видел я, как он усердно перелистывает старинные книги и жадно роется в пыли фамильных рукописей. Когда я как-то упрекнул его за бесполезные бессонные ночи, после которых он впадал в болезненное уныние, он взглянул на меня с горькой улыбкой и раскрыл передо мною историю города Рима. В этой книге, в двадцатой главе жизнеописания папы Александра Шестого, я прочел следующие строки, навсегда оставшиеся в моей памяти",
            "По этому поводу между отцом и сыном завязался спор. Цезарь считал, что достаточно применить одно из тех средств, которые он всегда держал наготове для своих ближайших друзей, а именно: пресловутый ключ, которым то одного, то другого просили отпереть некий шкаф. На ключе был крохотный железный шип – недосмотр слесаря. Каждый, кто трудился над тугим замком, накалывал себе палец и на другой день умирал. Был еще перстень с львиной головой, который Цезарь надевал, когда хотел пожать руку той или иной особе. Лев впивался в кожу этих избранных рук, и через сутки наступала смерть.",
            "Стол накрыли в папских виноградниках возле Сан-Пьетро-ин-Винколи, в прелестном уголке, понаслышке знакомом кардиналам. Роспильози, в восторге от своего нового звания и предвкушая пир, явился с самым веселым лицом. Спада, человек осторожный и очень любивший своего племянника, молодого офицера, подававшего блистательные надежды, взял лист бумаги, перо и написал свое завещание. Потом он послал сказать племяннику, чтобы тот ждал его у виноградников; но посланный, по-видимому, не застал того дома.",
            "Спада знал, что значит приглашение на обед. С тех пор как христианство – глубоко цивилизующая сила – восторжествовало в Риме, уже не центурион являлся объявить от имени тирана: «Цезарь желает, чтобы ты умер», а любезный легат с улыбкой говорил от имени папы: «Его святейшество желает, чтобы вы с ним отобедали»"
        ]
        return String(strings.random()!.prefix(count))
    }
}

public extension Bool {
    public static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}

public extension Int {
    public static func random(_ n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    public static func random(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min - 1))) + min
    }
}

public extension Double {
    public static func random() -> Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }
    
    public static func random(min: Double, max: Double) -> Double {
        return Double.random() * (max - min) + min
    }
}

public extension Float {
    public static func random() -> Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }
    
    public static func random(min: Float, max: Float) -> Float {
        return Float.random() * (max - min) + min
    }
}

public extension CGFloat {
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}

public extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension Collection where Index == Int {
    
    func random() -> Iterator.Element? {
        return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
    }
}

public extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            guard i != j else { continue }
            self.swapAt(i, j)
        }
    }
}
