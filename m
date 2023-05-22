Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C7579E1
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 10:44:17 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q131T-0006Zb-7z; Mon, 22 May 2023 12:44:15 +0200
Message-ID: <7efe5e64-d22b-99df-74e0-62acc54f1672@leemhuis.info>
Date: Mon, 22 May 2023 12:44:12 +0200
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
Content-Language: en-US, de-DE
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akira Shimahara <akira215corp@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <stefan.wahren@chargebyte.com>, regressions@lists.linux.dev
References: <b1093de5-9f62-6714-0063-7c719dc4f6ca@i2se.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <b1093de5-9f62-6714-0063-7c719dc4f6ca@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1684752258;9bd6d6e0;
X-HE-SMSGID: 1q131T-0006Zb-7z

On 26.04.23 15:39, Stefan Wahren wrote:
> recently we switch on our Tarragon board (i.MX6ULL) to Linux 6.1 and
> noticed that the connected 1-wire temperature sensors
> (w1_therm.w1_strong_pull=0) sometimes (~ 1 of 20 times) report 85
> degrees Celsius, which is AFAIK the only way to report errors to the
> 1-wire master:
> [...]
> #regzbot introduced: 67b392f7b8ed

#regzbot fix: w1_therm: optimizing temperature read timings
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

