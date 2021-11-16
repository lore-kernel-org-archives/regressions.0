Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF368
	for <regressions@lists.linux.dev>; Tue, 16 Nov 2021 10:59:29 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mmwBT-0007nZ-E9; Tue, 16 Nov 2021 11:59:27 +0100
Message-ID: <3d04b4da-bb49-b6f4-9203-4f43471ec650@leemhuis.info>
Date: Tue, 16 Nov 2021 11:59:27 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BW
To: Lorenz Bauer <lmb@cloudflare.com>, regressions@lists.linux.dev
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
 <CACAyw99GfxaJa9=gMbMMAJuE2YJ9+fDra-Z1j9fBpuAOovA9Ow@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Verifier rejects previously accepted program
In-Reply-To: <CACAyw99GfxaJa9=gMbMMAJuE2YJ9+fDra-Z1j9fBpuAOovA9Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637060370;5e839d04;
X-HE-SMSGID: 1mmwBT-0007nZ-E9

On 16.11.21 10:26, Lorenz Bauer wrote:
> On Wed, 3 Nov 2021 at 11:55, Lorenz Bauer <lmb@cloudflare.com> wrote:
>>
>> I started testing our load balancer on 5.15 today, unfortunately BPF
>> which is happy on 5.10 gets rejected on the latest kernel.
>>
>>     BPF program is too large. Processed 1000001 insn
>>     processed 1000001 insns (limit 1000000) max_states_per_insn 28
>> total_states 40641 peak_states 1104 mark_read 53
> 
> #regzbot fixed-by: 34d11a440c6167133201b7374065b59f259730d7

Many thx for this, regzbot picked this up and reacted (mostly(¹)) as
expected. But FWIW and for everybody information, turns out it wasn't
actually needed (but didn't do any harm), as Alexei added the link to
the regression report in above commit. Regzbot thus had noticed the
commit already when it turned up in next and marked the regression as
"to be fixed" – and will mark it as fixed, once the commit lands in
mainline.

Thx again, good to see that developer give regzbot a try!

Ciao, Thorsten

(¹) it didn't look up the commit summary in next to get a proper
description for it; not a big deal, but would have been nice to have, so
I will look into that later
