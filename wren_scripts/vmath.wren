class VMath {
    static degToRad(deg) {deg / 360 * Num.tau}
    static radToDeg(rad) {rad / Num.tau * 360}
}

class Vector {
    construct new(comps, flag){
        _comps = comps
        _flag = flag
    }
    dirty {_flag[0]}
    dirty=(val){_flag[0]=val}
    length {
        var len = 0
        for (comp in comps) {
            len = len + comp * comp
        }
        return len.sqrt
    }
    mulScalar(val){
        for (i in 0..._comps.count) {
            _comps[i] = _comps[i] * val
        }
        dirty = true
        return this
    }
    addVector(vec){
        var end = _comps.count.min(vec.comps.count)
        for (i in 0...end) {
            _comps[i] = _comps[i] + vec.comps[i]
        }
        dirty = true
        return this
    }
    subVector(vec){
        var end = _comps.count.min(vec.comps.count)
        for (i in 0...end) {
            _comps[i] = _comps[i] - vec.comps[i]
        }
        dirty = true
        return this
    }
    normalize(){
        var len = length
        if(len == 0) return this // cannot normalize a vector of length 0
        mulScalar(1 / len)
        return this
    }
    comps {_comps}
}

class Vector2 is Vector {
    construct new(x, y){
        super([x,y], [true])
    }
    construct new(x, y, flag){
        super([x,y], flag)
    }
    x {comps[0]}
    x=(val){
        comps[0] = val
        dirty = true
    }
    y {comps[1]}
    y=(val){
        comps[1] = val
        dirty = true
    }
    rotate(angle){
        var tempX = x * angle.cos - y * angle.sin
        var tempY = x * angle.sin + y * angle.cos
        x = tempX
        y = tempY
    }
    copy(){
        return Vector2.new(x, y)
    }
}

class Vector3 is Vector {
    construct new(x, y, z){
        super([x,y,z], [true])
    }
    construct new(x, y, z, flag){
        super([x,y,z], flag)
    }
    x {comps[0]}
    x=(val){
        comps[0] = val
        dirty = true
    }
    y {comps[1]}
    y=(val){
        comps[1] = val
        dirty = true
    }
    z {comps[2]}
    z=(val){
        comps[2] = val
        dirty = true
    }
    copy(){
        return Vector3.new(x, y, z)
    }
}

class Transform {
    construct new(){
        _dirty = [true]
        _position = Vector3.new(0, 0, 0, _dirty)
        _scale = Vector2.new(1, 1, _dirty)
        _origin = Vector3.new(0, 0, 0, _dirty)
        _angle = 0
    }
    position{_position}
    position=(val){
        _position = val
        dirty = true
    }
    scale{_scale}
    scale=(val){
        _scale = val
        dirty = true
    }
    angle{_angle}
    angle=(val){
        _angle = val
        dirty = true
    }
    origin{_origin}
    origin=(val){
        _origin = val
        dirty = true
    }
    dirty{_dirty[0]}
    dirty=(val){_dirty[0] = val}
}