Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC35CB5
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qog4t-0006XM-43; Fri, 06 Oct 2023 10:20:55 +0200
Message-ID: <9ffdce44-c1ca-4587-bcae-4bd1ebb52f61@leemhuis.info>
Date: Fri, 6 Oct 2023 10:20:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dm crypt: Fix reqsize in crypt_iv_eboiv_gen
Content-Language: en-US, de-DE
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Mike Snitzer <snitzer@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 =?UTF-8?Q?Tatu_Heikkil=C3=A4?= <tatu.heikkila@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Device Mapper <dm-devel@redhat.com>, Alasdair Kergon <agk@redhat.com>
References: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>
 <ZR9dEiXhQv-wBVA2@debian.me> <ZR9l446ndB4n1Xl4@gondor.apana.org.au>
 <ZR9wRq7Rkz+LocDX@redhat.com> <ZR9x6ifhd6axh5Ki@gondor.apana.org.au>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZR9x6ifhd6axh5Ki@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1696580464;29c6fdf2;
X-HE-SMSGID: 1qog4t-0006XM-43

On 06.10.23 04:33, Herbert Xu wrote:
> On Thu, Oct 05, 2023 at 10:26:14PM -0400, Mike Snitzer wrote:

BTW, Herbert, thx for taking care of this quickly!

>> Sure, please do.  Shouldn't your header Cc: stable given that the
>> Fixes commit implies v6.5 needs this fix?
> 
> Sure I'll add it although it will be picked up automatically due
> to the Fixes header.

FWIW, as some people don't know this: that might be the case, but there
is no guarantee, hence it's better to add it:

https://lore.kernel.org/all/2023060703-colony-shakily-3514@gregkh/

>  I'll also fix the reporter's name.

Side note: a Link: or Closes: tag to the report
(https://lore.kernel.org/all/f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com/
) would be nice as well.

Thx again. Ciao, Thorsten
