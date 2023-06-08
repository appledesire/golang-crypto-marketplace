package marketplace

import (
	"github.com/dchest/captcha"
	"github.com/gocraft/web"
	"github.com/mojocn/base64Captcha"
)

func (c *Context) ViewCaptchaImage(w web.ResponseWriter, r *web.Request) {
	captcha.WriteImage(w, r.PathParams["captcha_id"], 300, 100)
}

func (c *Context) ViewCaptchaImageV2(w web.ResponseWriter, r *web.Request) {
	var config = base64Captcha.ConfigCharacter{
		Height:             60,
		Width:              240,
		Mode:               base64Captcha.CaptchaModeArithmetic,
		ComplexOfNoiseText: base64Captcha.CaptchaComplexLower,
		ComplexOfNoiseDot:  base64Captcha.CaptchaComplexLower,
		IsUseSimpleFont:    true,
		IsShowHollowLine:   true,
		IsShowNoiseDot:     true,
		IsShowNoiseText:    true,
		IsShowSlimeLine:    true,
		IsShowSineLine:     true,
		CaptchaLen:         6,
	}
	_, captchaInterfaceIntance := base64Captcha.GenerateCaptcha(r.PathParams["captcha_id"], config)
	captchaInterfaceIntance.WriteTo(w)
}
