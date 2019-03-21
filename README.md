# HK Daily Pig Supply Auction

This repo is a practice of  XMLParse.

## API Used

http://www.fehd.gov.hk/tc_chi/sh/data/daily_supply_auction.xml

## On Simulator
![](https://i.imgur.com/BaERmPa.png)


## Notes
- init
```
let xmlParser = XMLParser(data: data!) // the data is the data we get when we call the API
xmlParser.delegate = self.shared
xmlParser.parse() // start to parse and use the corresponding function the the delegate
```
- conform to XMLParserDelegate 
```
// parse 到element開始的tag
func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) 


// parse 到element的內容, 將該element的內容加到相應的 property 中
func parser(_ parser: XMLParser, foundCharacters string: String) 


// parse 最後一個tag
func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) 
```
