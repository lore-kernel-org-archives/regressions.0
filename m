Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1C1428A
	for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 10:07:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qkiVI-0000OE-If; Mon, 25 Sep 2023 12:07:48 +0200
Message-ID: <f30a4d64-c265-4f6a-94bb-632b1c07f15f@leemhuis.info>
Date: Mon, 25 Sep 2023 12:07:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: greentime.hu@sifive.com, bjorn@kernel.org, prashanthsw@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Mathis Salmen <mathis.salmen@matsal.de>, Guo Ren <guoren@kernel.org>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230822164904.21660-1-andy.chiu@sifive.com>
 <169351910642.23657.16115457219052816039.b4-ty@rivosinc.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <169351910642.23657.16115457219052816039.b4-ty@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695636475;4f050dad;
X-HE-SMSGID: 1qkiVI-0000OE-If

On 31.08.23 23:58, Palmer Dabbelt wrote:
> 
> On Tue, 22 Aug 2023 16:49:03 +0000, Andy Chiu wrote:
>> The alternative stack checking in get_sigframe introduced by the Vector
>> support is not needed and has a problem. It is not needed as we have
>> already validate it at the beginning of the function if we are already
>> on an altstack. If not, the size of an altstack is always validated at
>> its allocation stage with sigaltstack_size_valid().
>>
>> Besides, we must only regard the size of an altstack if the handler of a
>> signal is registered with SA_ONSTACK. So, blindly checking overflow of
>> an altstack if sas_ss_size not equals to zero will check against wrong
>> signal handlers if only a subset of signals are registered with
>> SA_ONSTACK.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] riscv: signal: fix sigaltstack frame size checking
>       https://git.kernel.org/palmer/c/d77303a57c95

Just wondering: what happened to this patch, which afaics is currently
in neither mainline nor next? Because according to
https://bugzilla.kernel.org/show_bug.cgi?id=217923 it fixes rustc
userspace crashes with 6.5. Was a different approach found?

Ciao, Thorsten
