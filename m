Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FF63CC
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 10:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667EFC433C7;
	Thu, 31 Aug 2023 10:35:07 +0000 (UTC)
Message-ID: <150a5670-8220-5c2f-351c-181ceeddf307@xs4all.nl>
Date: Thu, 31 Aug 2023 12:35:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: in linux 6.3.7-200.fc38.x86_64 goes vlc in time to switch tv
 channels to zombie-process
Content-Language: en-US, nl
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>
References: <a7f997fc-e7cc-cf67-3ac0-80ed30346511@gmail.com>
 <cdacb249-9d1d-cad9-44a9-ffa7b4b5b887@leemhuis.info>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <cdacb249-9d1d-cad9-44a9-ffa7b4b5b887@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 11:26, Linux regression tracking #update (Thorsten Leemhuis) wrote:
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
> 
> On 19.06.23 02:24, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>> [...]
>>
>> #regzbot introduced: v6.3.5..v6.3.7 https://bugzilla.kernel.org/show_bug.cgi?id=217566
>> #regzbot title: switching TV channel causes VLC and firmware loading hang
> 
> #regzbot fix: 7cfab4c9dc09ca3a9d57c187894055a22bdcd
> #regzbot ignore-activity
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
> 
> 

From what I can gather from the bugzilla report, whatever the issue was appears
to be resolved or at least improved in later kernels.

I can't find any relevant differences for the dvb-usb-v2/dvbsky/si2168 drivers that
are used here, even if I diff between v6.2.1 and v6.4.1. So either fedora
applied some patch that is not in linux-stable, or the issue is elsewhere,
outside the media subsystem.

Regards,

	Hans
