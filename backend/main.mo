import Text "mo:base/Text";
import Blob "mo:base/Blob";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";

actor {
  public func formatMarkdown(text : Text) : async Text {
    // In a real implementation, we would process the Markdown here
    // For this example, we'll just return the original text
    return text;
  };

  public func downloadHTML(text : Text) : async Text {
    let htmlPrefix = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><title>Formatted Markdown</title></head><body>";
    let htmlSuffix = "</body></html>";
    let content = await formatMarkdown(text);
    return htmlPrefix # content # htmlSuffix;
  };
}