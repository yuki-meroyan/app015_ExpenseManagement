class Account < ActiveHash::Base
  self.data = [
      {no: 1, name: '経費'}, {no: 2, name: '雑費'}, {no: 3, name: '人件費'}
    # , {no: 4, name: ''}, {no: 5, name: ''}, {no: 6, name: ''}
  ]
end