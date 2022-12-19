Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314710EF
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 09:59:54 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7Cw4-00070z-7R; Mon, 19 Dec 2022 10:59:52 +0100
Message-ID: <90bf9797-a949-b75b-285a-9056b9ba7f56@leemhuis.info>
Date: Mon, 19 Dec 2022 10:59:51 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: BUG: unable to handle kernel paging request in bpf_dispatcher_xdp
 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: bpf <bpf@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>
References: <CACkBjsYioeJLhJAZ=Sq4CAL2O_W+5uqcJynFgLSizWLqEjNrjw@mail.gmail.com>
 <96ee7141-f09c-4df9-015b-6ae8f3588091@leemhuis.info>
In-Reply-To: <96ee7141-f09c-4df9-015b-6ae8f3588091@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671443994;e444b515;
X-HE-SMSGID: 1p7Cw4-00070z-7R

On 08.12.22 09:44, Thorsten Leemhuis wrote:
> [Note: this mail contains only information for Linux kernel regression
> tracking. Mails like these contain '#forregzbot' in the subject to make
> then easy to spot and filter out. The author also tried to remove most
> or all individuals from the list of recipients to spare them the hassle.]
> 
> On 06.12.22 04:28, Hao Sun wrote:
>>
>> The following crash can be triggered with the BPF prog provided.
>> It seems the verifier passed some invalid progs. I will try to simplify
>> the C reproducer, for now, the following can reproduce this:
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced c86df29d11df
> #regzbot title net/bpf: BUG: unable to handle kernel paging request in
> bpf_dispatcher_xdp
> #regzbot ignore-activity

#regzbot fix: bpf: Synchronize dispatcher update with
bpf_dispatcher_xdp_func
