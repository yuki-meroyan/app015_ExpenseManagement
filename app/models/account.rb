class Account < ActiveHash::Base
  self.data = [
      {no: 1, name: '経費'}, {no: 2, name: '人件費'}, {no: 3, name: '雑費'},
      {no: 4, name: '売上'}, {no: 5, name: '秋田県'}, {no: 6, name: '山形県'}
  ]
end