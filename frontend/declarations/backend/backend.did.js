export const idlFactory = ({ IDL }) => {
  const Result = IDL.Variant({ 'ok' : IDL.Text, 'err' : IDL.Text });
  return IDL.Service({
    'downloadHTML' : IDL.Func([IDL.Text], [Result], []),
    'formatMarkdown' : IDL.Func([IDL.Text], [Result], []),
    'viewFormattedMarkdown' : IDL.Func([IDL.Text], [Result], []),
  });
};
export const init = ({ IDL }) => { return []; };
