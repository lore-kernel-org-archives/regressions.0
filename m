Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2465A168
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 08:37:23 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nCdns-0000ic-7B; Wed, 26 Jan 2022 09:37:20 +0100
Message-ID: <3ee8c6c9-52d1-9570-f3bf-490365c9f6fe@leemhuis.info>
Date: Wed, 26 Jan 2022 09:37:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: FYI: I stopped CCing maintainers when getting regressions reported to
 bugzilla tracked
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1643186243;a3b18ff1;
X-HE-SMSGID: 1nCdns-0000ic-7B

Hi! Just FYI:

Since a few weeks I'm watching out for new regressions reported to
bugzilla.kernel.org and make regzbot track all I notice. When I started
doing this, I CCed maintainers (and involved developers, in case the
issue was bisected) on my mails for regzbot and the regressions mailing
list. I've stopped that a few days agao, as it's pretty time consuming
and exhausting. But don't worry, I'll get the maintainers into the loop
after a few days (likely after about week), if I notice nobody acts on
the bugzilla report.

Yes, that's not ideal and might lead to delays that could have been
avoided. But otherwise I'd become a human solution partly fixing the
"bugs reported to bugzilla in some cases never reach the right people or
get ignored by them" problem -- and I have no interest in spending my
spare time on that. But FWIW, I plan to compile some numbers on how many
regression reports in bugzilla.kernel.org were acted upon by the
maintainers within a few days. If things are bleak, maybe those numbers
might help to get the situation improved somehow. Time will tell.

Ciao, Thorsten
