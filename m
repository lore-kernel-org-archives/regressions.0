Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788E2F21
	for <regressions@lists.linux.dev>; Thu, 22 Dec 2022 12:36:13 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8Knz-00046C-Hn; Thu, 22 Dec 2022 13:36:11 +0100
Message-ID: <7910b036-d639-0e1f-4638-fce5497487a7@leemhuis.info>
Date: Thu, 22 Dec 2022 13:36:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [6.2][regression] after commit
 cd372b8c99c5a5cf6a464acebb7e4a79af7ec8ae stopping working wifi mt7921e
 #forregzbot
Content-Language: en-US, de-DE
To: Linux List Kernel Mailing <linux-wireless@vger.kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CABXGCsMEnQd=gYKTd1knRsWuxCb=Etv5nAre+XJS_s5FgVteYA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CABXGCsMEnQd=gYKTd1knRsWuxCb=Etv5nAre+XJS_s5FgVteYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671712573;03b0d581;
X-HE-SMSGID: 1p8Knz-00046C-Hn

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 21.12.22 02:10, Mikhail Gavrilov wrote:
> Hi,
> The kernel 6.2 preparation cycle has begun.
> And after the kernel was updated on my laptop, the wifi stopped working.
> 
> Bisecting blames this commit:
> cd372b8c99c5a5cf6a464acebb7e4a79af7ec8ae is the first bad commit
> commit cd372b8c99c5a5cf6a464acebb7e4a79af7ec8ae
> Author: Lorenzo Bianconi <lorenzo@kernel.org>
> Date:   Sat Nov 12 16:40:35 2022 +0100
> 
>     wifi: mt76: add WED RX support to mt76_dma_{add,get}_buf
> 

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot introduced cd372b8c99c5a5 ^
https://bugzilla.kernel.org/show_bug.cgi?id=216829
#regzbot title wifi: mt76: wifi stopped working
#regzbot ignore-activity
Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

