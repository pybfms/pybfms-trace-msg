
import pybfms

@pybfms.bfm(hdl={
    pybfms.BfmType.Verilog : pybfms.bfm_hdl_path(__file__, "hdl/trace_msg_bfm.v"),
    pybfms.BfmType.SystemVerilog : pybfms.bfm_hdl_path(__file__, "hdl/trace_msg_bfm.v"),
    }, has_init=True)
class TraceMsgBfm():

    def __init__(self):
        self.busy = pybfms.lock()
        self.is_reset = False
        self.reset_ev = pybfms.event()
        self.msg_sz = 0
        pass
        
    @pybfms.export_task(pybfms.uint32_t)
    def _set_parameters(self, msg_sz):
        print("TraceBFM: msg_sz=%d" % msg_sz)
        self.msg_sz = msg_sz
        
    @pybfms.export_task()
    def _reset(self):
        self.is_reset = True
        self.reset_ev.set()
        
    def set_msg(self, idx, msg):
        self._set_msg(idx, msg)
        
    def clr_msg(self, idx):
        self._clr_msg(idx)
        
    def _set_msg(self, idx, msg):
        self._clr_msg(idx)
        
        if len(msg) > self.msg_sz:
            msg = msg[0:self.msg_sz-3]
            msg += "..."
        
        for i,c in enumerate(msg.encode()):
            self._set_msg_c(idx, i, c)
    
    @pybfms.import_task(pybfms.uint8_t,pybfms.uint8_t,pybfms.uint8_t)
    def _set_msg_c(self, msg, idx, c):
        pass

    @pybfms.import_task(pybfms.uint8_t)    
    def _clr_msg(self, idx):
        pass
        
        
