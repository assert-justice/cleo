import "engine" for Engine
import "node" for Node
import "input" for Input
import "window" for Window
import "renderer" for Renderer
import "audio_system" for AudioSystem
import "tilemap" for TileMap
import "sprite" for Sprite
import "vmath" for VMath, Vector2, Vector3
import "animated_sprite" for AnimatedSprite
import "audio_source" for AudioSource
import "pool" for Pool
import "bullet" for Bullet
import "random" for Random
import "player" for Player
import "goomba" for Goomba

class Game is Node {
    construct new(){
        super(null)
        var tracker = 0
        var fnames = [
            "game_data/sprites/characters_packed.png",
            "game_data/sprites/tiles_packed.png",
            "game_data/sprites/kenny_mini_square_mono_12x9.png",
        ]
        for (fname in fnames) {
            var stats = Renderer.blitFileToAtlas(fname, 0, tracker)
            tracker = tracker + stats["height"]
        }
        _tileMap = TileMap.new(this, 27, 15, 18, 18, 0, tracker)
        _tileMap.addTemplate(0, 72, true)
        for (x in 0..._tileMap.width) {
            for(y in 0..._tileMap.height){
                if (x == 0 || x == _tileMap.width-1 || y == 0 || y == _tileMap.height-1){
                    _tileMap.setTile(0, x, y)
                }
            }
        }
        for(x in 8...16) {
            _tileMap.setTile(0, x, 13)
        }
        _player = Player.new(this, _tileMap)
        _player.transform.position.x = 100
        _player.transform.position.y = 100
        _goomba = Goomba.new(this, _tileMap)
        _goomba.transform.position.x = 200
        _goomba.transform.position.y = 200

        // _player.setVisible(true)
        // _pool = Pool.new(0) {Bullet.new(null, Vector2.new(4 * 24, 24), Vector2.new(24, 24), Vector2.new(0, 3) )}
        // _markPool = Pool.new(0) {Bullet.new(null, Vector2.new(3 * 24, 2 * 24), Vector2.new(24, 24), Vector2.new(0, 3) )}
        // _emitClock = 0
        // _emitTime = 0.25
        // _random = Random.new()
        // Engine.enableLogging("logging.txt")
        // _spr = _pool.get(this)
        // _source = AudioSource.new(this, "game_data/sfx/Climb_Rope_Loop_00.wav")
        // _source.volume = 0.25
        // _tileMap.setTile(0, 1, 1)
        // _tileMap.setTile(1, 1, 1)
        // _x = 100
        // _y = 100
        // _speed = 200
        // _colors = ["green", "blue", "pink", "orange", "cream"]
        // _anim = "green"
        // _player = AnimatedSprite.new(this, Vector2.new(0,0), Vector2.new(24, 24), 5)
        // var i = 0
        // for (color in _colors) {
        //     var x = i * 48
        //     var y = 0
        //     if (i == 4){
        //         x = 0
        //         y = 24
        //     }
        //     _player.newAnim(color)
        //     _player.addFrame(color,Vector2.new(x,y), Vector2.new(24, 24))
        //     _player.addFrame(color,Vector2.new(x+24,y), Vector2.new(24, 24))
        //     i = i + 1
        // }
        // // _player.play(_anim)
        // _player.transform.position.x = _x
        // _player.transform.position.y = _y
        // _atlas = Sprite.new(this, 0,0,24, 24)
        // _atlas.transform.position.x = _x
        // _atlas.transform.position.y = _y
        // _atlas = Sprite.new(this, 0,0,1024, 1024)
        // _atlas.transform.position.x = _x
        // _atlas.transform.position.y = _y
        // _vel = Vector3.new(0,0,0)
        // AudioSystem.addAudioSource()
        // AudioSystem.loadAudioSource(0, "game_data/sfx/Climb_Rope_Loop_00.wav")
        // AudioSystem.setGainAudioSource(0, 50)
    }
    update(deltaTime){
        if(Input.getButtonPressed("ui_cancel", 0)){
            Engine.quit()
        }
        // System.print(_player.visible)
        // if(_emitClock > 0){
        //     _emitClock = _emitClock - deltaTime
        // } else{
        //     _emitClock = _emitTime
        //     var bullet = _pool.get(this)
        //     var mark = _markPool.get(this)
        //     bullet.transform.position.x = _random.float() * 400
        //     bullet.transform.position.y = 0
        //     mark.transform.position.x = bullet.transform.position.x
        //     mark.transform.position.y = bullet.transform.position.y
        //     bullet.transform.angle = VMath.degToRad(45)
        //     bullet.transform.scale.x = 2
        //     bullet.transform.origin.x = bullet.dimensions.x / 2
        //     bullet.transform.origin.y = bullet.dimensions.y / 2
        // }
        // if(Input.getButtonPressed("fire", 0)){
        //     // AudioSystem.playAudioSource(0)
        //     _source.play()
        //     var i = _colors.indexOf(_anim) + 1
        //     if (i == _colors.count) i = 0
        //     _anim = _colors[i]
        // }
        // var move = Input.getAxis2("move", 0)
        // move.mulScalar(_speed * deltaTime)
        // _vel.x = move.x
        // _vel.y = move.y
        // var newPos = _tileMap.collide(_player.transform.position, _vel, 24, 24)
        // if (newPos.x == _player.transform.position.x) _player.pause()
        // if (newPos.x != _player.transform.position.x && !_player.playing) _player.play(_anim)
        // _player.transform.position = newPos
        // _atlas.transform.position.x = _atlas.transform.position.x + _vel.x
        // _atlas.transform.position.y = _atlas.transform.position.y + _vel.y
        // it's important to call the super method
        // typically after we have handled our own updates
        // that way if we change a child it will update accordingly *this* tick
        super.update(deltaTime)
    }
}