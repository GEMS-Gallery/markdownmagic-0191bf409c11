export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'downloadHTML' : IDL.Func([IDL.Text], [IDL.Text], []),
    'formatMarkdown' : IDL.Func([IDL.Text], [IDL.Text], []),
  });
};
export const init = ({ IDL }) => { return []; };
