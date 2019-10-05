# frozen_string_literal: true

require 'gosu'
require './Player'

class Display < Gosu::Window
  def initialize
    super 1500, 1000, resizable: true
    self.caption = 'Lonely Soul!'
    @background_image = Gosu::Image.new('3_game_background.png', tileable: true)
    @soundeffect = Gosu::Song.new('halloween.wav')
    @player = Player.new
    @soundeffect.play(true)
    @player.warp(320, 240)
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def update
    if Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::GP_LEFT)
      @player.turn_left
    end
    if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::GP_RIGHT)
      @player.turn_right
    end
    if Gosu.button_down?(Gosu::KB_UP) || Gosu.button_down?(Gosu::GP_BUTTON_0)
      @player.accelerate
    end
    @player.move
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Display.new.show
