Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86737F
	for <regressions@lists.linux.dev>; Sat, 22 Apr 2023 08:09:16 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pq8Iy-0005eX-Sj; Sat, 22 Apr 2023 10:09:12 +0200
Message-ID: <834c05ee-287d-e5bf-be07-dec0d6f4b4b4@leemhuis.info>
Date: Sat, 22 Apr 2023 10:09:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [REGRESSION] Bug 217353 - Logitech MX Anywhere 3 scroll wheel
 works incorrectly over USB dongle
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Bastien Nocera <hadess@hadess.net>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <5fa67291-98d0-c8d5-ca71-5a86b9adff41@leemhuis.info>
In-Reply-To: <5fa67291-98d0-c8d5-ca71-5a86b9adff41@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1682150956;bb96e718;
X-HE-SMSGID: 1pq8Iy-0005eX-Sj

Lo!

On 21.04.23 11:11, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> Bastien, from the bug report it to me sounds like it might be another
> case caused by 908d325e166 ("HID: logitech-hidpp: Detect hi-res
> scrolling support"), but I might be totally wrong with that (and the
> reporter didn't even explicitly state that it's a regression, but it
> sounds like one). If I got something wrong I apologize in advance.
> 
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217353 :

Ignore that mail, user in between noticed it's a userspace problem.
Sorry for the noise.

#regzbot resolved: userspace problem according to the reporter
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.




