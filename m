Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99939D
	for <regressions@lists.linux.dev>; Thu,  7 Jul 2022 08:20:22 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o9Mk9-0001Rr-QT; Thu, 07 Jul 2022 10:20:13 +0200
Message-ID: <77dbe20b-b99d-ec7c-9043-6d2b053303ad@leemhuis.info>
Date: Thu, 7 Jul 2022 10:20:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Regression?] Linux 5.19-rc5 gets stuck on boot, not rc4
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <272584304.305738.1657029005216@office.mailbox.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <272584304.305738.1657029005216@office.mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657182022;bebfe54d;
X-HE-SMSGID: 1o9Mk9-0001Rr-QT

On 05.07.22 15:50, torvic9@mailbox.org wrote:

> Linux 5.19-rc5 does not boot on my Kaby Lake Thinkpad.
> rc3 and rc4 were still fine, so I guess something between rc4 and rc5
> introduced a regression.
> 
> Unfortunately, there are no errors or warning messages.
> It gets stuck quite early on boot, about the time USB is initialized,
> so less than 1 second into post-bootloader boot.
> It then just sits there doing nothing - SysRq still works though.
> 
> I don't have time for a bisect, but I thought I'll let you know about
> this issue, and maybe someone already has an idea.
> [...]

This is mostly dealt with already, as can be seen from this thread,
nevertheless adding it to the tracking:

#regzbot ^introduced ee7a69aa38d8
#regzbot title drm: fbdev/simplefb: Linux 5.19-rc5 gets stuck on boot,
not rc4
#regzbot ignore-activity
#regzbot fixed-by: bf43e4521ff3223a

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
