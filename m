Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57D733D2
	for <regressions@lists.linux.dev>; Thu, 22 Dec 2022 12:06:03 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8KKn-0004Lk-6t; Thu, 22 Dec 2022 13:06:01 +0100
Message-ID: <962eff8e-8417-1096-f72b-4238ca4b0713@leemhuis.info>
Date: Thu, 22 Dec 2022 13:06:00 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: mainline build failure due to e240e53ae0ab ("mm, slub: add
 CONFIG_SLUB_TINY") #forregzbot
Content-Language: en-US, de-DE
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <Y5hTTGf/RA2kpqOF@debian>
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <Y5hTTGf/RA2kpqOF@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671710763;60933c3e;
X-HE-SMSGID: 1p8KKn-0004Lk-6t

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 13.12.22 11:26, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> The latest mainline kernel branch fails to build xtensa allmodconfig 
> with gcc-11 with the error:
> 
> kernel/kcsan/kcsan_test.c: In function '__report_matches':
> kernel/kcsan/kcsan_test.c:257:1: error: the frame size of 1680 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>   257 | }
>       | ^
> 
> git bisect pointed to e240e53ae0ab ("mm, slub: add CONFIG_SLUB_TINY")

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced e240e53ae0ab
#regzbot title mm, slub: CONFIG_SLUB_TINY causes various build errors
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
