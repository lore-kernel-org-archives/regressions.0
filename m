Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F004970;
	Fri, 23 Apr 2021 06:34:32 +0000 (UTC)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1lZpOY-0005Wh-NT; Fri, 23 Apr 2021 08:34:30 +0200
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, regressions@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>, ksummit@lists.linux.dev,
 workflows@vger.kernel.org
References: <268a3049-7c0b-8a33-1ff6-5a2d35fcba16@leemhuis.info>
 <20210422145107.GH4572@sirena.org.uk>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: RFC: building a regression tracking bot for Linux kernel
 development
Message-ID: <1390e998-4847-eebf-1d7b-e9cb6625cff7@leemhuis.info>
Date: Fri, 23 Apr 2021 08:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210422145107.GH4572@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1619159673;8d252f6c;
X-HE-SMSGID: 1lZpOY-0005Wh-NT

On 22.04.21 16:51, Mark Brown wrote:
> On Thu, Apr 22, 2021 at 09:16:40AM +0200, Thorsten Leemhuis wrote:
> 
>> That's it already. The regression was tracked with:
> 
>>  * minimal overhead for the reporter
>>  * no additional overhead for the developers – only something they ought
>> to do already became more important
> 
> For things that are caught by the various automated systems the
> deduplication might get annoying - even for the systems with a human in
> the loop it's very common for things that the automated systems pick up
> to end up getting reported several times over due to things like race
> conditions in the reporting process.  We'll have to see how that goes,
> it might be possible to automate some of it.

Yeah, good point, thx for pointing it out, will keep an eye on this
aspect to make sure it doesn't become a big problem.

Ciao, Thorsten

