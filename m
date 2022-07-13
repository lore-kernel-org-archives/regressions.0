Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE317C3
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 06:07:13 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oBVWh-0003pj-7x; Wed, 13 Jul 2022 08:07:11 +0200
Message-ID: <85f80df3-0343-b231-755d-7c1eb7a2c0c5@leemhuis.info>
Date: Wed, 13 Jul 2022 08:07:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [BUILD BUG] regression from certs: Move load_certificate_list()
 to be with the asymmetric keys code #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220712104554.408dbf42@gandalf.local.home>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220712104554.408dbf42@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657692433;6b6633d5;
X-HE-SMSGID: 1oBVWh-0003pj-7x

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 12.07.22 16:45, Steven Rostedt wrote:
> 
> I have a config that now fails to build due to commit 60050ffe3d770
> ("certs: Move load_certificate_list() to be with the asymmetric keys code")
> 
>   CC      .vmlinux.export.o
>   LD      .tmp_vmlinux.kallsyms1
> ld: certs/system_keyring.o: in function `load_system_certificate_list':
> system_keyring.c:(.init.text+0x35): undefined reference to `x509_load_certificate_list'
> make[1]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:1164: vmlinux] Error 1
> make[1]: Leaving directory '/work/build/trace/nobackup/mxtest'
> make: *** [Makefile:219: __sub-make] Error 2
> 
> 
> If I revert this commit, it builds fine.
> 

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 60050ffe3d770
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
