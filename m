Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3610E2
	for <regressions@lists.linux.dev>; Mon, 26 Dec 2022 12:48:20 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p9mtu-0001dk-Pp; Mon, 26 Dec 2022 13:48:18 +0100
Message-ID: <ad271bce-3441-ee96-d049-349ba6046003@leemhuis.info>
Date: Mon, 26 Dec 2022 13:48:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: =?UTF-8?Q?Bug=c2=a0216844_-_Mediatek_MT7921_Driver_Crashing_Upon_Mo?=
 =?UTF-8?Q?dprobe?=
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672058900;bb582f88;
X-HE-SMSGID: 1p9mtu-0001dk-Pp

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot ^introduced v6.0..v6.1
https://bugzilla.kernel.org/show_bug.cgi?id=216844
#regzbot title net: wifi: Mediatek MT7921 Driver Crashing Upon Modprobe
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Suspected duplicate:
https://bugzilla.kernel.org/show_bug.cgi?id=216839

Might be fixed by
https://patchwork.kernel.org/project/linux-wireless/patch/20221217085624.52077-1-nbd@nbd.name/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

