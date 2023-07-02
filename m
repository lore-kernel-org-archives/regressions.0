Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84D1C04
	for <regressions@lists.linux.dev>; Sun,  2 Jul 2023 12:13:03 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qFvwp-0004uX-LZ; Sun, 02 Jul 2023 14:12:59 +0200
Message-ID: <eb12b370-f1a1-c198-8ad6-18857647c246@leemhuis.info>
Date: Sun, 2 Jul 2023 14:12:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: commit 9df9d2f0471b causes boot failure in pre-rc1 6.5
 kernel
Content-Language: en-US, de-DE
To: Thomas Gleixner <tglx@linutronix.de>, Bagas Sanjaya
 <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Borislav Petkov <bp@alien8.de>
References: <4d9fb4a9-6c48-600c-f625-8ef66208090a@gmail.com>
 <ZKAboYIj6pAd9CMO@debian.me>
 <74014a7a-7d91-0854-8002-faf32d9c65e1@leemhuis.info> <878rbzxzx4.ffs@tglx>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <878rbzxzx4.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688299983;d71f7969;
X-HE-SMSGID: 1qFvwp-0004uX-LZ

On 01.07.23 20:13, Thomas Gleixner wrote:
> On Sat, Jul 01 2023 at 14:43, Linux regression tracking #update (Thorsten Leemhuis) wrote:
>> Bagas, FWIW, there was no need for this at all. Regzbot would have
>> noticed that patch automatically due to the "Link:
>> https://bugzilla.kernel.org/show_bug.cgi?id=217602" in the patch
>> description (thx for this, tglx) once it landed in next or mainline
>> (just like it noticed
>> https://lore.kernel.org/lkml/168813193932.404.2885732890333911092.tip-bot2@tip-bot2/
>> earlier).
> 
> I just looked at your tracking site and noticed a small hickup. There is
> "Noteworthy: [1]"  [1] is a link, but that does not really work:
> 
>    https://bugzilla.kernel.org/show_bug.cgi?id=87jzvm12q0.ffs@tglx
> 
> Makes bugzilla unhappy :)

Well, it could have at least tried to understand what's wanted here ;)
[Just kidding of course.]

Took me a while to find where things went sideways in regzbot, but found
and fixed it so it won't happen again; a few wrong entries in the DB
will remain, but they within the next few weeks will become history (and
I might manually fixup one or two).

Thx for letting me know, I had seen this earlier myself, but forgotten this.

Ohh, and thx for addressing the regression so quickly!

Ciao, Thorsten
