Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB737E
	for <regressions@lists.linux.dev>; Fri, 20 May 2022 07:38:08 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nrxD3-00040m-Tp; Fri, 20 May 2022 09:38:06 +0200
Message-ID: <b6dcde8e-b944-b222-7cff-5caef418638e@leemhuis.info>
Date: Fri, 20 May 2022 09:38:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Regression: CIFS umount fails since 14302ee33 with some servers
 (exit code 32) #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <writing@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <715d745d-5a85-092a-68c2-b9b1dd8ad53e@leemhuis.info>
 <5fc82f02-be3a-6bb4-0800-aaf19a782655@leemhuis.info>
 <64a7de55-8f93-8e7a-4102-26f7d4dbe1dc@pre-sense.de> <87zgjx1d09.fsf@cjr.nz>
 <29f90334-53dc-4926-fc38-420b4d024f1b@leemhuis.info>
In-Reply-To: <29f90334-53dc-4926-fc38-420b4d024f1b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;writing@leemhuis.info;1653032288;a05afd7f;
X-HE-SMSGID: 1nrxD3-00040m-Tp

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 04.05.22 18:43, Thorsten Leemhuis wrote:
> On 04.05.22 18:25, Paulo Alcantara wrote:
>> Moritz Duge <duge@pre-sense.de> writes:
>>
>>> I'm still waiting for a reply from Paul.
>>
>> The bug is currently being handled at [1].  Enzo has also asked you to
>> send us network traces in [2] and you haven't sent any, yet.
> 
> Many thx for the update.
> 
>> I'm not "Paul", BTW.
> 
> Paulo, please accept my apologies, that was my fault.
> 
>> [1] https://bugzilla.opensuse.org/show_bug.cgi?id=1194945
>> [2] https://bugzilla.opensuse.org/show_bug.cgi?id=1194945#c13
> 
> #regzbot link: https://bugzilla.opensuse.org/show_bug.cgi?id=1194945

#regzbot invalid: likely solved, likely by 5d7e282541fc ("cifs: do not
skip link targets when an I/O fails")

To quote
https://bugzilla.kernel.org/show_bug.cgi?id=215782#c2

> The problem disappeared with one of the latest openSUSE kernel updates.
> It must have been one of these:
> 2022-04-06: ​5.3.18-150300.59.63
> ​2022-05-05: 5.3.18-150300.59.68
> 
> I didn't do a bisect. But the following commit, contained in SUSE kernel 5.3.18-150300.59.68, seems most likely to me.
> 
> kernel.org
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=5d7e282541fc91b831a5c4477c5d72881c623df9
> 
> SUSE kernel:
> https://github.com/SUSE/kernel/commit/f6c7673fbee1985e8fcfe4936ca6d91852f86b13
> 
> SUSE kernel source:
> https://github.com/SUSE/kernel-source/commit/e7007189db138241fce6440c3bcfa084a0cf7c72
Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


Ciao,
