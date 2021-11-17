# coding: utf-8
class Document < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  belongs_to :assigner, foreign_key: 'assigner_id', class_name: 'User'
  belongs_to :project, optional: true

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :location, presence: true
  validates :project, presence: true
end
