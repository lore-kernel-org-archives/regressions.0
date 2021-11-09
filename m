Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926ED68
	for <regressions@lists.linux.dev>; Tue,  9 Nov 2021 10:28:56 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mkON4-0002G7-E0; Tue, 09 Nov 2021 11:28:54 +0100
Message-ID: <c156e850-2aa6-33e5-37c6-efcc2fd72b42@leemhuis.info>
Date: Tue, 9 Nov 2021 11:28:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <c639c965-5231-b745-7b59-476877202e0c@gmail.com>
 <fd7df619-3eba-b142-cc20-97edf9f20c4d@leemhuis.info>
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
In-Reply-To: <fd7df619-3eba-b142-cc20-97edf9f20c4d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1636453736;a136f721;
X-HE-SMSGID: 1mkON4-0002G7-E0

On 01.11.21 17:46, Thorsten Leemhuis wrote:
> On 01.11.21 04:33, Walt Jr. Brake wrote:
>> Three month ago, My USB 3.1 device cannot be detected after upgrade
>> kernel from version 5.10.41 to 5.10.42.
>>
>> And I found some other people ran into the same issue:
>>
>> https://forum.manjaro.org/t/kernel-5-10-59-doesnt-detect-a-connected-usb-external-disk/79320
>>
>> https://forum.manjaro.org/t/how-to-make-active-usb-hub-work-in-manjaro/84548
>>
>>
>> Two days ago, I try to fix the issue myself, and I found out that it was
>> cause by this patch. After revert this patch, my USB 3.1 device can be
>> detect again.
>>
>> I have already file a bug on here:
>> https://bugzilla.kernel.org/show_bug.cgi?id=214875.
> 
> #regzbot ^introduced 90d28fb53d4a51299ff324dede015d5cb11b88a2
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=214875

#regzbot fixed-by e1959faf085b004e6c3afaaaa743381f00e7c015
#regzbot ignore-activity

BTW, to anyone is reading this and wondering why it's needed: regzbot
needed the above, as the fix for this regression(¹) lacked a Link: tag
with the URL to the report. It it had been there, regzbot would have
automatically noticed the fix when it showed up in next.

Thinking aloud: The fix was posted in the thread with the regression
report. Regzbot could be enhanced to detect such cases automatically.

Thinking aloud, too: regzbot could be enhanced to notice if a mail or a
commit mentioned a commit-id that is known to cause a tracked regression.

I guess the former might not be worth it, the latter OTOH might be a
good idea I will keep in mind.

Ciao, Thorsten


(¹)
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e1959faf085b004e6c3afaaaa743381f00e7c015


