Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AC2ECE
	for <regressions@lists.linux.dev>; Mon, 26 Dec 2022 12:47:01 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p9msY-0001Hw-GJ; Mon, 26 Dec 2022 13:46:54 +0100
Message-ID: <e85d24d1-0ac5-f580-bb89-907ee77e65ea@leemhuis.info>
Date: Mon, 26 Dec 2022 13:46:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: =?UTF-8?Q?Bug=c2=a0216839_-_Connecting_a_MT76_device_causes_compute?=
 =?UTF-8?Q?r_to_hang_since_linux_6=2e1?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1672058822;6e37e1e3;
X-HE-SMSGID: 1p9msY-0001Hw-GJ

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot ^introduced v6.0..v6.1
https://bugzilla.kernel.org/show_bug.cgi?id=216839
#regzbot title hang with mediatek MT76 device during boot
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Possible duplicate:
https://bugzilla.kernel.org/show_bug.cgi?id=216844

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

