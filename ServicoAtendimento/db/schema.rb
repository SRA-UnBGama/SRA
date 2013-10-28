# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131028203434) do

  create_table "alunos", :force => true do |t|
    t.string   "matricula"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "atendimentos", :force => true do |t|
    t.string   "nome"
    t.string   "registro"
    t.datetime "dataHora"
    t.string   "publicoAlvo"
    t.integer  "TipoAtendimento_id"
    t.integer  "LocalAtendimento_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "atendimentos", ["LocalAtendimento_id"], :name => "index_atendimentos_on_LocalAtendimento_id"
  add_index "atendimentos", ["TipoAtendimento_id"], :name => "index_atendimentos_on_TipoAtendimento_id"

  create_table "local_atendimentos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pessoas", :force => true do |t|
    t.integer  "as_pessoa_id"
    t.string   "as_pessoa_type"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "professors", :force => true do |t|
    t.string   "matricula"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_atendimentos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
