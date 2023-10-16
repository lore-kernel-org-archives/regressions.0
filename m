Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60B1549F
	for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qsIrU-00043l-Hx; Mon, 16 Oct 2023 10:22:04 +0200
Message-ID: <18b15c5b-da86-4abf-8501-b50bac69e247@leemhuis.info>
Date: Mon, 16 Oct 2023 10:22:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [bisected][regression] rustc userspace crashes on riscv in
 kernel 6.5
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, Vineet Gupta <vineetg@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 matoro <matoro_bugzilla_kernel@matoro.tk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
References: <49a92f24-bd70-483c-aaaa-49d00c339b12@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <49a92f24-bd70-483c-aaaa-49d00c339b12@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697444528;f6b240a3;
X-HE-SMSGID: 1qsIrU-00043l-Hx

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.09.23 02:02, Bagas Sanjaya wrote:
>> Since this commit:
>>
>> commit 8ee0b41898fa26f66e32237f179b6989c65600d6
>> Author: Greentime Hu <greentime.hu@sifive.com>
>> Date:   Mon Jun 5 11:07:11 2023 +0000
>>
>>     riscv: signal: Add sigcontext save/restore for vector
>>
>> running rustc on riscv produces output like this:
> [...]
> #regzbot introduced: 8ee0b41898fa26 https://bugzilla.kernel.org/show_bug.cgi?id=217923

Fix is now in mainline (thx Palmer!). Contains a Fixes tag, so will most
likely end up in the the next or the next but one 6.5.y release; if not,
please speak up.

#regzbot fix: 14a270bfab7ab1c4b605c01eeca5557447ad5a2b
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
