Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A9768
	for <regressions@lists.linux.dev>; Thu, 18 Nov 2021 05:43:59 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mnaDF-0004TW-Pt; Thu, 18 Nov 2021 06:43:57 +0100
Message-ID: <23cc4d9c-c20c-cc68-d1fe-e3fda96b357d@leemhuis.info>
Date: Thu, 18 Nov 2021 06:43:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [REGRESSION] 5.16rc1: SA_IMMUTABLE breaks debuggers
Content-Language: en-BS
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAP045AoMY4xf8aC_4QU_-j7obuEPYgTcnQQP3Yxk=2X90jtpjw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAP045AoMY4xf8aC_4QU_-j7obuEPYgTcnQQP3Yxk=2X90jtpjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637214240;e66f581f;
X-HE-SMSGID: 1mnaDF-0004TW-Pt

On 17.11.21 19:47, Kyle Huey wrote:
> rr, a userspace record and replay debugger[0], is completely broken on
> 5.16rc1. I bisected this to 00b06da29cf9dc633cdba87acd3f57f4df3fd5c7.

TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 00b06da29cf9dc633cdba87acd3f57f4df3fd5c7
#regzbot title SA_IMMUTABLE breaks debuggers like rr
#regzbot ignore-activity

FYI: I removed everyone else and the other lists from the To or CC to
avoid noise, as this mail is meaningless for them.

Ciao, Thorsten, your Linux kernel regression tracker.

P.S.: If you want to know more about regzbot, check out its
web-interface, the getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

But note, regzbot is doing its first field-testing now and thus still
has some bugs. Adding this regression will help be to find them, hence
feel free to ignore this mail or any errors you spot in the web-ui.

