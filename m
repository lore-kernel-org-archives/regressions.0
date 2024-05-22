Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD134C62
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716360477; cv=none; b=n7MPvfRpFEE763k87qx4+yWslE4tqodingHZkF1gAKXTqmYUdb3RRKKer3fV/TrKUpx4vf6J5WI0/0BxyI5WMInrKOkavaelojlfKJ1hzmJ9EeCiS3s4rxSEBYurKe2AP0f1Z4+YgD9qqlKeVAYVUFUg/8NSj2DGb8JcxWPlxoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716360477; c=relaxed/simple;
	bh=C98dNNvOMZu7p9SqjIFXmC0yFx9hKllBGWNNkLbY1cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLJPObh+CQdIaIiJVb1s69DONjlMXxAbb/4obGokhC1LQ/LCmbP0uteVmQ8ct6wpfkPwziuIPBBUwnDa2qA1+iFzfbTa+81FE5Uzde63MgOz72fDZnnnVTetAIfb3Jysi/GcsdMsbW6e2z/exC/0hEjB6Rmvr+raqEhc13f2SkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.3] (unknown [95.90.241.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BDD5861E5FE05;
	Wed, 22 May 2024 08:47:25 +0200 (CEST)
Message-ID: <5906e1b4-8c9f-41b8-967f-df838dcec89c@molgen.mpg.de>
Date: Wed, 22 May 2024 08:47:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lib/build_OID_registry: Bareword found where operator expected at
 ./lib/build_OID_registry line 41, near "s#^\Q$abs_srctree/\E##r"
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev,
 kernel@pengutronix.de
References: <259f7a87-2692-480e-9073-1c1c35b52f67@molgen.mpg.de>
 <dgj2ghmghasb5drrjof45ji7jus52yonnvskcmhrvbfenphs37@lknclpncrwmb>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <dgj2ghmghasb5drrjof45ji7jus52yonnvskcmhrvbfenphs37@lknclpncrwmb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Uwe,


Thank you for your reply.

Am 22.05.24 um 08:28 schrieb Uwe Kleine-König:

> On Mon, May 20, 2024 at 08:36:18AM +0200, Paul Menzel wrote:
>> Your commit 5ef6dc08cfde (lib/build_OID_registry: don't mention the full
>> path of the script in output), causes the build error below:
>>
>>      Bareword found where operator expected at ./lib/build_OID_registry line 41, near "s#^\Q$abs_srctree/\E##r"
>>      syntax error at ./lib/build_OID_registry line 41, near "s#^\Q$abs_srctree/\E##r"
>>      Execution of ./lib/build_OID_registry aborted due to compilation errors.
>>      make[3]: *** [lib/Makefile:352: lib/oid_registry_data.c] Error 255
> 
> I cannot reproduce that and wonder about the build bots not reporting
> this issue. The patch you report as broken is in next since >3 weeks.
> 
>> gcc (GCC) 12.3.0 is used.
> 
> Given that the error is in a Perl script, the version of your Perl
> interpreter would be more enlightening.

Good point.

     $ perl --version

     This is perl 5, version 12, subversion 1 (v5.12.1) built for 
x86_64-linux-thread-multi
     […]

And that seems to be it. Using Perl v5.34.0, the build succeeds.

> Also I'm not fluent in Perl, so if someone with more Perl foo could
> assist, that would be great.

Kind regards,

Paul
