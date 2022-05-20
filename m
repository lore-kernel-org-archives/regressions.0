Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066515A9
	for <regressions@lists.linux.dev>; Fri, 20 May 2022 06:08:16 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nrvnu-0005lu-63; Fri, 20 May 2022 08:08:02 +0200
Message-ID: <e9597cbc-cabb-facf-deb6-662d40cf16a3@leemhuis.info>
Date: Fri, 20 May 2022 08:08:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/1] um: fix error return code in winch_tramp()
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>, Nathan Chancellor <nathan@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Zhen Lei <thunder.leizhen@huawei.com>, Jeff Dike <jdike@addtoit.com>,
 anton ivanov <anton.ivanov@cambridgegreys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Eduard-Gabriel Munteanu <maxdamage@aladin.ro>,
 linux-um <linux-um@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 regressions <regressions@lists.linux.dev>
References: <20210508032239.2177-1-thunder.leizhen@huawei.com>
 <Yjt31seiNv18HYrf@dev-arch.thelio-3990X>
 <1b03d888-cea3-3e6f-087f-daeb5642a975@leemhuis.info>
 <1087614384.239493.1649583213699.JavaMail.zimbra@nod.at>
 <YlRp9KR1mp3/4Txo@thelio-3990X>
 <1287561645.244713.1649702724736.JavaMail.zimbra@nod.at>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <1287561645.244713.1649702724736.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653026896;aee6ddeb;
X-HE-SMSGID: 1nrvnu-0005lu-63

On 11.04.22 20:45, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Nathan Chancellor" <nathan@kernel.org>
>> I attempted to print out the error code but it seems like there is no
>> output in the console after "reboot: System halted". If I add an
>> unconditional print right before the call to os_set_fd_block(), I see it
>> during start up but I do not see it during shutdown. Is there some way
>> to see that console output during shutdown?
> 
> I think in this case the easiest way is attaching gdb with a breakpoint.

I noticed this in my list of open regressions. It seems there wasn't any
progress to get this regression fixed (please let me know in case I
missed something), but I guess nobody considered it urgent which is
likely not that much of a problem in this case. Hence I'm moving this to
the back-burner:

#regzbot backburner: special case and UML a leisure pursuit for the
maintainer

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.



