Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992F28F0
	for <regressions@lists.linux.dev>; Thu, 22 Dec 2022 11:04:08 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8JMr-0002fT-MQ; Thu, 22 Dec 2022 12:04:05 +0100
Message-ID: <3a919c76-9ba9-28f5-058e-b684edfc45c0@leemhuis.info>
Date: Thu, 22 Dec 2022 12:04:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: dri-devel@lists.freedesktop.org
References: <CAPDLWs_7331QyD_Mnb9k1LrBsYopeVVbd9zDM_2R-xCoG272PA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPDLWs_7331QyD_Mnb9k1LrBsYopeVVbd9zDM_2R-xCoG272PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671707048;58c732bb;
X-HE-SMSGID: 1p8JMr-0002fT-MQ

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 21.12.22 03:23, Kaiwan N Billimoria wrote:
> [REGRESSION] ?
>
> Testing with 6.1, I find the same issue - VirtualBox VMs seem to hang
> on boot, though the kernel has this patch applied of course...
> Am running VirtualBox 7.0.4 on an x86_64 Linux (Ubuntu 22.04.1) host;
> the system hangs on boot with the screen
> going blank.
> Passing 'nomodeset' via GRUB fixes it..

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced v6.0..v6.1
#regzbot title dri: vmwgfx: boot hang in VirtualBox due to an oops
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
