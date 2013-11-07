module CloudstackNagios
  module Helper
    def load_template(template_path)
      if File.file?(template_path)
        templ = File.read(template_path)
        return Erubis::Eruby.new(templ)
      else
        say "Error: template not found #{template_path}"
        exit 1
      end
    end

    def cs_routers
      routers = client.list_routers(status: 'Running')
      routers += client.list_routers(projectid: -1, status: 'Running')
    end
  end
end
