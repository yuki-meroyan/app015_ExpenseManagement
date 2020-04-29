class Account < ActiveHash::Base
  self.data = [
      {id: 1, name: '経費'}, {id: 2, name: '雑費'}, {id: 3, name: '人件費'}
    # , {id: 4, name: ''}, {id: 5, name: ''}, {id: 6, name: ''}
  ]
end