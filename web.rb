#!/usr/bin/env ruby
require 'rubygems'
require 'bundler'
Bundler.require
require 'goliath'
require 'goliath/websocket'
require 'goliath/rack/templates'
require './turboname.rb'

module Goliath
  module Plugin
    class TurbonameClient

      def initialize(port, config, status, logger)
        @channel = config['channel']
        @dictionary = Turboname::Random.new
      end

      def run
        give_tick = proc {
          name = Turboname::Domain.new from: @dictionary
          tld = if name.tldize and [true, false].sample then name.tldize else 'com' end
          available = name.available? tld
          if name.length < 15 and available then
            @channel << "#{name}.#{tld} is available!"
          else
            @channel << "searching for domain names.#{'.'*rand(3)}"
          end
          EM.next_tick(give_tick);
        }
        give_tick.call
      end
    end
  end
end

class Websocket < Goliath::WebSocket
  include Goliath::Rack::Templates
  plugin Goliath::Plugin::TurbonameClient

  use Goliath::Rack::Favicon, File.expand_path(File.dirname(__FILE__) + '/ws/favicon.ico')

  def on_open(env)
    env['subscription'] = env.channel.subscribe { |m| env.stream_send(m) }
  end

  # def on_message(env, msg)
  #   env.logger.info("WS MESSAGE: #{msg}")
  #   env.channel << msg
  # end

  def on_close(env)
    env.channel.unsubscribe(env['subscription'])
  end

  def on_error(env, error)
    env.logger.error error
  end

  def response(env)
    if env['REQUEST_PATH'] == '/ws'
      super(env)
    else
      [200, {}, erb(:index, :views => Goliath::Application.root_path('ws'))]
    end
  end
end
