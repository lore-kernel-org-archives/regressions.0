Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F97E3
	for <regressions@lists.linux.dev>; Thu,  8 Dec 2022 14:43:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p3I7Q-0004OQ-Gd; Thu, 08 Dec 2022 15:43:24 +0100
Message-ID: <5e8317f7-170a-588b-7a94-e0a546fbc9f3@leemhuis.info>
Date: Thu, 8 Dec 2022 15:43:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: =?UTF-8?Q?=5bregression=5d_Bug=c2=a0216782_-_resume_from_suspend_br?=
 =?UTF-8?Q?oken_on_Asus_UX305FA?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670510607;99e66389;
X-HE-SMSGID: 1p3I7Q-0004OQ-Gd

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. It afaics needs
more debugging, but I nevertheless want add it to the tracking.

#regzbot introduced: v6.0..v6.1-rc1
https://bugzilla.kernel.org/show_bug.cgi?id=216782
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
