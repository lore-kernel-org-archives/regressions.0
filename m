Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1222F4D
	for <regressions@lists.linux.dev>; Fri,  7 Jul 2023 12:52:33 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qHkwm-0006RT-L1; Fri, 07 Jul 2023 14:52:28 +0200
Message-ID: <423a78fe-ac40-9983-ff44-90b1759fc0b5@leemhuis.info>
Date: Fri, 7 Jul 2023 14:52:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: mainline build failure due to df8fc4e934c1 ("kbuild: Enable
 -fstrict-flex-arrays=3")
Content-Language: en-US, de-DE
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev
References: <ZJ2M4yqnOCqqGWH0@debian>
 <c0db4c48-6090-5c72-b597-9d4146dbc26c@embeddedor.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <c0db4c48-6090-5c72-b597-9d4146dbc26c@embeddedor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688734353;9af5cdfa;
X-HE-SMSGID: 1qHkwm-0006RT-L1

On 29.06.23 16:09, Gustavo A. R. Silva wrote:
> 
> Thanks for the report. See my comments below.

Thx for your reply.

> On 6/29/23 07:53, Sudip Mukherjee (Codethink) wrote:
>>
>> The latest mainline kernel branch fails to build with clang (version
>> 16.0.1), and the errors are like:
>>
>> drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past
>> the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'),
>> cast to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
>>                                  (((__le32 *)aifcmd->data)[1] ==
>> cpu_to_le32(3));
>>                                              ^             ~
> [...]
> These are addressed by this patch:
> https://lore.kernel.org/linux-hardening/65907ee4083de62fbaadc5c2e6512e3828912d1b.1687974498.git.gustavoars@kernel.org/
> 
> in this series (for which I'll send v2 shortly):
> https://lore.kernel.org/linux-hardening/62386518-4123-db1f-4656-6b4ea509f5b1@embeddedor.com/T/

Are those fixes still on track? Looks like there was not much progress
since then, so I suspect this won't be fixed before -rc1? Or did miss
something?

Ciao, Thorsten

> [...]
>>
>> git bisect pointed to df8fc4e934c1 ("kbuild: Enable
>> -fstrict-flex-arrays=3").
>>
>> Reverting the commit has fixed the build failure.
>>
>> I will be happy to test any patch or provide any extra log if needed.
>>
>> #regzbot introduced: df8fc4e934c12b906d08050d7779f292b9c5c6b5
>>
>>
> 
> 
