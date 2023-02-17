Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9E631
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 05:18:02 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSt8A-0006Uf-Ur; Fri, 17 Feb 2023 06:17:59 +0100
Message-ID: <06a5ada1-d1b8-3139-3a60-f43958f90f79@leemhuis.info>
Date: Fri, 17 Feb 2023 06:17:58 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [Regression] Bug 216961 - Severe IO scheduling starvation issues
 with btrfs
Content-Language: en-US, de-DE
To: Josef Bacik <josef@toxicpanda.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Wyatt Childers <kernel.dbwta@haxing.ninja>, pmacedo@gmail.com
References: <0ca02b1f-ab00-9fa6-aecc-c2c46d624e49@leemhuis.info>
 <e0998928-0f4e-f2a9-2e77-3e4bab459688@leemhuis.info>
 <CAEzrpqc6tweHqKKPZYyVuOXH1Wd+hmrTPfcrpa-5-btU_Z24Fg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAEzrpqc6tweHqKKPZYyVuOXH1Wd+hmrTPfcrpa-5-btU_Z24Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676611082;e9c80e51;
X-HE-SMSGID: 1pSt8A-0006Uf-Ur

On 16.02.23 23:39, Josef Bacik wrote:
> On Thu, Feb 16, 2023 at 12:43 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Hi btrfs maintainers and developers.
>>
>> I might be missing something, but it looks like the report was ignored.
>> Is there a reason for that?
> 
> Mostly just being blind.

Happens.

>  I've responded to the BZ, I'll investigate
> through the BZ.

Great, many thx!

Ciao, THorsten
