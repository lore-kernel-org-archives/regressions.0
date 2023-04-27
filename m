Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5E23D9
	for <regressions@lists.linux.dev>; Thu, 27 Apr 2023 11:47:08 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MO9r5-1pcpoc48xF-00OWDH; Thu, 27 Apr 2023 13:47:04 +0200
Message-ID: <7e89c6ea-3ea0-bbd7-1261-9ca687e4d09d@i2se.com>
Date: Thu, 27 Apr 2023 13:47:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Regression: w1_therm: sysfs w1_slave sometimes report 85 degrees
 Celsius
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akira Shimahara <akira215corp@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stefan Wahren <stefan.wahren@chargebyte.com>, regressions@lists.linux.dev
References: <b1093de5-9f62-6714-0063-7c719dc4f6ca@i2se.com>
 <2023042645-attentive-amends-7b0b@gregkh>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <2023042645-attentive-amends-7b0b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DywFAflWM0RArQGlZHMeRccCQPE695q/C0HyS5erfKRh7g0cAyp
 UndXvZym9ujBvdG1o+8SlYHVdsumnlCMDGSdCZGXbQzkREDKGki1Q2fOQ1nS6Ck3bzZ1nCn
 tvXPtkDRBf/cPz3ciNGMM4zdPS68tp/I0dvLanOwgHNW8f8Yfcr51pmRk6zroFMOhgFy6sY
 tgSrTJ3/1PkqmcJkum77w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FYdSZXaX/kU=;MpA4uryXMae2Sv1ywSY2DHF5TPj
 lXPcUJS2fnjHk/iHSl9mvngxpgsoGPWCEsIZYJu26fo2I5xgcLPflUy0R6vjhs8JgpT1afSqo
 07PGALW4TVB9wgjWohSOxdmnYLGlMzgaici0mBwFKWMSnoCezwutYeo/sEhBqwHkcDxw3Yus+
 d32SoqTzl6jxIgiBHj4E1AnB4DsRqlhqeVEAsDYD3BFyPDKWG6vl/gI37kxtpmHne//fa1Jxn
 NZVYvZZ3oTV88QLo9QsqYd6bo0HHjpAE1AeC8jmhzrnQX1y0dv5Sd3YUxHUBRiELe/qFr0iDt
 4FgBVbITq7wBCGQpAP3DJP+QJGVJwfnWuEvV17srJRbICMNV6F4+TD0v2uqyVT8v29EN/SBOZ
 4U1UGDkU3ew03P5688G3PRSnvomCZD+Zh3d4FeSvbhhDR5QFc5tlfaMH1KK3GILUMwuxHzj2R
 HLyD1UzstsoIGHWTK064wK/t36hzJlEVzp0C0RcDcjP8N54OlFpgD+eTK0CmVv7/FEoHuqbd4
 2ZyR8dnS4p0TCTermP8K/Z5pdu0kuzxFzMow2dyi+Ly2QnYvGaumNWYzHPKr9R6j3ph2icO/Q
 PJoWSgaSj5K8O2NdnanmBJVZKZ7B0B3OWb7biso4ElaUYD5PnZMlH+nSSd6L7rEUg2UbiBxKu
 kBeS4MU6PdBHaYl7iWjuWuRIWH+aSCenXwBurOfiew==

> Can you send a patch that shows the change you wish to have made here so
> that you can get credit for fixing the issue?

Sure, just for reference:

https://lore.kernel.org/lkml/20230427112152.12313-1-stefan.wahren@i2se.com/T/

> 
> thanks,
> 
> greg k-h
