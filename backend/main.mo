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

  public func viewFormattedMarkdown(text : Text) : async Text {
    let htmlPrefix = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><title>View Formatted Markdown</title><style>body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen,Ubuntu,Cantarell,'Open Sans','Helvetica Neue',sans-serif;line-height:1.6;color:#333;max-width:800px;margin:0 auto;padding:20px;background-color:#ffffff;}h1,h2,h3,h4,h5,h6{margin-top:24px;margin-bottom:16px;font-weight:600;line-height:1.25;color:#000;}h1{font-size:2em;border-bottom:1px solid #eaecef;padding-bottom:.3em;}h2{font-size:1.5em;border-bottom:1px solid #eaecef;padding-bottom:.3em;}h3{font-size:1.25em;}h4{font-size:1em;}h5{font-size:.875em;}h6{font-size:.85em;color:#6a737d;}pre{background-color:#f6f8fa;border-radius:3px;font-size:85%;line-height:1.45;overflow:auto;padding:16px;}code{background-color:rgba(27,31,35,.05);border-radius:3px;font-size:85%;margin:0;padding:.2em .4em;}blockquote{border-left:.25em solid #dfe2e5;color:#6a737d;padding:0 1em;}table{border-collapse:collapse;margin-bottom:16px;}table th,table td{border:1px solid #dfe2e5;padding:6px 13px;}table tr:nth-child(2n){background-color:#f6f8fa;}</style></head><body>";
    let htmlSuffix = "</body></html>";
    let content = await formatMarkdown(text);
    return htmlPrefix # content # htmlSuffix;
  };
}