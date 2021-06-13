require "rails_helper"

RSpec.describe TarefasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tarefas").to route_to("tarefas#index")
    end

    it "routes to #show" do
      expect(get: "/tarefas/1").to route_to("tarefas#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tarefas").to route_to("tarefas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tarefas/1").to route_to("tarefas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tarefas/1").to route_to("tarefas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tarefas/1").to route_to("tarefas#destroy", id: "1")
    end
  end
end
