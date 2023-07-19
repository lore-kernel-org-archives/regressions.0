Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98202107B6
	for <regressions@lists.linux.dev>; Wed, 19 Jul 2023 12:48:53 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qM6bn-0004pH-9s; Wed, 19 Jul 2023 14:48:47 +0200
Message-ID: <3252775c-099f-4bbe-c663-122634d5fc2f@leemhuis.info>
Date: Wed, 19 Jul 2023 14:48:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me>
 <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
 <5983cf9d-dc1e-75bd-3624-770951661245@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <5983cf9d-dc1e-75bd-3624-770951661245@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689770933;c400913e;
X-HE-SMSGID: 1qM6bn-0004pH-9s

On 19.07.23 14:36, Bagas Sanjaya wrote:
> On 7/18/23 17:06, Thorsten Leemhuis wrote:
>> I'm missing something here:
>>
>> * What makes you think this is caused by bdb616479eff419? I didn't see
>> anything in the thread that claims this, but I might be missing something
>> * related: if I understand Randy right, this is only happening in -next;
>> so why is bdb616479eff419 the culprit, which is also in mainline since
>> End of June?
> 
> Actually drivers/video/fbdev/ps3bf.c only had two non-merge commits during
> previous cycle: 25ec15abb06194 and bdb616479eff419. The former was simply
> adding .owner field in ps3fb_ops (hence trivial), so I inferred that the
> culprit was likely the latter (due to it was being authored by Thomas).

As you can see from Michael's reply this was misguided, as it was an
external change that broke the driver. This happens all the time, such
inferring thus is not possible at all.

Ciao, Thorsten
