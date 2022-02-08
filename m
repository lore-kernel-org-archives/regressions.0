Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9EC2F2C
	for <regressions@lists.linux.dev>; Tue,  8 Feb 2022 18:22:30 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nHV8E-0006rv-9m; Tue, 08 Feb 2022 19:22:26 +0100
Message-ID: <df18cc2e-fa46-b088-85c6-959d8b6ea4ea@leemhuis.info>
Date: Tue, 8 Feb 2022 19:22:25 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BS
To: Jason Self <jason@bluehome.net>, Stefan Agner <stefan@agner.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Johannes Berg
 <johannes.berg@intel.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev
References: <20220203161959.3edf1d6e@valencia>
 <00b41f5de94fca5ef995ab2c95def4aa@agner.ch>
 <20220208100529.41d1b4d7@valencia>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Regression/boot failure on 5.16.3
In-Reply-To: <20220208100529.41d1b4d7@valencia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644344550;3afbab59;
X-HE-SMSGID: 1nHV8E-0006rv-9m

On 08.02.22 19:05, Jason Self wrote:
> On Tue, 08 Feb 2022 09:50:59 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> On 2022-02-04 01:19, Jason Self wrote:
>>  [...]  
>>
>> I have several reports of Intel NUC 10th/11th gen not booting/crashing
>> during boot after updating to 5.10.96 (from 5.10.91). At least one
>> stack trace shows iwl_dealloc_ucode in the call path. The below
>> commit is part of 5.10.96 So this regression seems to not only affect
>> 5.16 series.
>>
>> Link:
>> https://github.com/home-assistant/operating-system/issues/1739#issuecomment-1032013069
> 
> Yes, it does appear to affect multiple versions; at least 5.17-rc2,
> 5.16, 5.15, and as you say 5.10.
> 
> I can confirm that this patch addresses it on 5.16:
> https://lore.kernel.org/stable/YgJSEEmRDKKG+3lT@mail-itl/T/#t

Thx for pointing to the thread!

#regzbot monitor: https://lore.kernel.org/stable/YgJSEEmRDKKG+3lT@mail-itl/

> It appears desirable to apply the patch to all of the stable versions
> that need it, after it's gone into Linus's tree to also address the
> matter with the upcoming 5.17 series.

FWIW, the patch is marked for backporting already, it just needs to get
merged to mainline first.

Ciao, Thorsten
